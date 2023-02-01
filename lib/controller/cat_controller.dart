// ignore_for_file: avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers, unused_local_variable, invalid_use_of_protected_member

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:petsguide/constants/cats_list.dart';
import 'package:petsguide/service/firebase_query_service.dart';
import 'package:petsguide/model/caratteristiche_model.dart';
import 'package:petsguide/model/cat_model.dart';
import 'package:petsguide/model/punteggio_model.dart';
import 'package:petsguide/service/secure_service.dart';
import 'package:petsguide/service/utils_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CatController extends GetxController {
  RxList<Cats> catsList = <Cats>[].obs;
  RxList<Cats> catsListCorto = <Cats>[].obs;
  RxList<Cats> catsListMedio = <Cats>[].obs;
  RxList<Cats> catsListLungo = <Cats>[].obs;
  RxList<Cats> catsListSenza = <Cats>[].obs;
  RxList<Cats> catsCarousel = <Cats>[].obs;
  RxList<Cats> listCatPunteggiUser = <Cats>[].obs;
  RxList<Cats> listCatPreferiti = <Cats>[].obs;

  RxList<PunteggioModel> listPunteggi = <PunteggioModel>[].obs;
  RxList<CaratteristicheModel> caratteristiche = <CaratteristicheModel>[].obs;

  Rxn<Cats> catSelected = Rxn<Cats>();

  CollectionReference dbPunteggi = FirebaseFirestore.instance.collection('punteggi');
  
  RxDouble punteggioMedio = 0.0.obs;
  RxDouble initialRating = 0.0.obs;
  int ratingSelected = 0;
  RxBool loading = false.obs;
  RxBool loadingPunteggio = false.obs;
  

  setCatPreferito() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? preferitiString = prefs.getStringList('preferiti');
    if(preferitiString != null) {
      preferitiString.add(catSelected.value!.id);
      await prefs.setStringList('preferiti', preferitiString);
    } else{
      List<String> listIdCatPreferiti = [];
      listIdCatPreferiti.add(catSelected.value!.id);
      await prefs.setStringList('preferiti', listIdCatPreferiti);
    }
  }

  getListCatPreferiti() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? preferitiString = prefs.getStringList('preferiti');
    if(preferitiString != null) {
      // listCatPreferiti.value = Cats.decode(preferitiString);
      FirebaseQueryService firebaseQueryService = Injector().get<FirebaseQueryService>();
      listCatPreferiti.value = await firebaseQueryService.mapCatPreferitiByAll(preferitiString, catsList);
      listCatPreferiti.refresh();
    }

  }

  getCatsList() {
    return catsList;
  }

  setRatingSelected(rating) {
    ratingSelected = rating.toInt();
  }

  getPunteggioAttualeByUser() async{
    var punteggio = await getPunteggioByIdUserAndCatId();
    initialRating.value = punteggio.punteggio.toDouble();
    initialRating.refresh();
  }

  getListPunteggiByIdUser() async{
    if(listCatPunteggiUser.value.isEmpty) {
      loading.value = true;
      loading.refresh();
      listPunteggi.value = [];
      listPunteggi.refresh();

      PunteggioModel punteggio = PunteggioModel();
      Cats cat = Cats();
      final CatController catController = Get.put(CatController());
      await FirebaseFirestore.instance
      .collection('punteggi')
      .where('idUser', isEqualTo: await catController.getUserId())
      .get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) async{
          punteggio = PunteggioModel(
            idPunteggio: doc.reference.id, 
            punteggio: doc['punteggio'], 
            idUser: doc['idUser'], 
            idCat: doc['idCat']
          );
          listPunteggi.add(punteggio);
        });
      });
    await filterCatByIdFromFullList();
    }
    
  }

  filterCatByIdFromFullList() async{
    listCatPunteggiUser.value = [];
    listCatPunteggiUser.refresh();
    listPunteggi.forEach((element) {
      for(int i=0; i<catsList.length; i++) {
        if(element.idCat == catsList[i].id) {
          Cats cat = Cats();
          cat = catsList[i];
          cat.punteggioUser = element.punteggio;
          listCatPunteggiUser.add(cat);
        }
      }
    });

    listCatPunteggiUser.refresh();
    loading.value = false;
    loading.refresh();    
  }

  setPunteggio() async {
    loadingPunteggio.value = true;
    loadingPunteggio.refresh();
    var punteggio = await getPunteggioByIdUserAndCatId();
    if(punteggio.idPunteggio != '' && punteggio.idPunteggio != null) {
      await FirebaseFirestore.instance
      .collection('punteggi')
      .doc(punteggio.idPunteggio)
      .update({
        "punteggio": ratingSelected
      }).then((value) async {
        getPunteggioMedio(catSelected.value!.id);
        setPunteggioInListCatPunteggi(punteggio.idCat, ratingSelected);
      });
    } else {
      await dbPunteggi.add(
        {
          "idUser": await getUserId(),
          "punteggio": ratingSelected,
          "idCat": catSelected.value!.id
        }
      ).then((value) async {
        await getPunteggioMedio(catSelected.value!.id);
        loadingPunteggio.value = false;
        loadingPunteggio.refresh();
      });
    }
  }

  setPunteggioInListCatPunteggi(idCat, rating) {
    if(listCatPunteggiUser.isNotEmpty) {
      listCatPunteggiUser.forEach((element) {
        if(element.id == idCat) {
          element.punteggioUser = rating;
        }
      });
    }
    listCatPunteggiUser.refresh();
    loadingPunteggio.value = false;
    loadingPunteggio.refresh();

  }

  getPunteggioMedio(idCatSelect) async{
    List<int> listaPunteggi = [];
    punteggioMedio.value = 0.0;
    await FirebaseFirestore.instance
      .collection('punteggi')
      .where('idCat', isEqualTo: idCatSelect)
      .get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            listaPunteggi.add(doc['punteggio']);
        });
      });

    if(listaPunteggi.isNotEmpty) {
      listaPunteggi.forEach((element) { 
        punteggioMedio.value += element;
      });
      punteggioMedio.value = punteggioMedio.value / listaPunteggi.length;
      punteggioMedio.value = double.parse(punteggioMedio.value.toStringAsFixed(1));
    }
    else {
      punteggioMedio.value = 0;
    }
    punteggioMedio.refresh();
  }

  getUserId() async{
    SecureService secureService = Injector().get<SecureService>();
    return await secureService.getUserId();
  }

  getPunteggioByIdUserAndCatId() async{
    PunteggioModel punteggio = PunteggioModel();
    await FirebaseFirestore.instance
      .collection('punteggi')
      .where('idUser', isEqualTo: await getUserId())
      .where('idCat', isEqualTo: catSelected.value!.id)
      .get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          punteggio = PunteggioModel(
            idPunteggio: doc.reference.id, 
            punteggio: doc['punteggio'], 
            idUser: doc['idUser'], 
            idCat: doc['idCat']);
        });
      });
      return punteggio;  
  }

  getCatsCarousel() {
    catsCarousel.assignAll([]);
    Random random = Random();
    while(catsCarousel.length != 5) {
      int randomNumber = random.nextInt(catsList.length); 
      if(!catsCarousel.contains(catsList[randomNumber])) {
        catsCarousel.add(catsList[randomNumber]);
      }
    }
    catsCarousel.refresh();
  }

  getLinkImage() async{
    Reference ref = FirebaseStorage.instance.ref().child("bengala.png");
    String url = (await ref.getDownloadURL()).toString();
  }

  getCats() async {
    if(catsList.isEmpty) {
      catsList.value = [];
      FirebaseQueryService firebaseQueryService = Injector().get<FirebaseQueryService>();
      catsList.value = await firebaseQueryService.getCats();
      
      catsList.sort(((a, b) => a.razza!.compareTo(b.razza!)));
      getCatsPeloCorto();
      getCatsPeloMedio();
      getCatsPeloLungo();
      getCatsSenzaPelo();
      getCatsCarousel();
    }
  }

  getCatsPeloCorto() async {
    catsListCorto.value = [];
    catsListCorto = changeFilterCats(0);
    catsListCorto.refresh();
  }

  getCatsPeloMedio() {
    catsListMedio.value = [];
    catsListMedio = changeFilterCats(1);
    catsListMedio.refresh();
  }

  getCatsPeloLungo() {
    catsListLungo.value = [];
    catsListLungo = changeFilterCats(2);
    catsListLungo.refresh();
  }

  getCatsSenzaPelo() {
    catsListSenza.value = [];
    catsListSenza = changeFilterCats(3);
    catsListSenza.refresh();
  }
 
  changeFilterCats(tabIndex) {
    List mantelli = INDEXPELO;
    String mantello = '';
    mantelli.forEach((element) {
      if(element['id'] == tabIndex) {
        mantello = element['mantello'];
      } 
    },    
    );
    RxList<Cats> list = <Cats>[].obs;
    catsList.forEach((element) {
      if(element.mantello == mantello) {
        list.add(element);
      }
    });
    return list;
    // catsList.refresh();
  }

  setCatSelect(cat) {
    
    caratteristiche.value = [];
    catSelected.value = cat;

    catSelected.value!.descrizione = catSelected.value!.descrizione!.replaceAll('/n', '\n');
    catSelected.value!.origine = catSelected.value!.origine!.replaceAll('/n', '\n');
    catSelected.value!.carattere = catSelected.value!.carattere!.replaceAll('/n', '\n');

    List<String> listCaratteristiche = catSelected.value!.aspettiPrincipali!.split(",");
    catSelected.refresh();
    listCaratteristiche.forEach((element) {
      CaratteristicheModel carat = CaratteristicheModel(  
        punteggio: getPunteggioCaratteristica(element),
        descrizione: getDescrizione(element, 1)
      ); 
      caratteristiche.add(carat);

    });
    caratteristiche.refresh();
    getPunteggioMedio(catSelected.value!.id);
  }

  getPunteggioCaratteristica(element) {
    UtilsService utilsService = Injector().get<UtilsService>();
    return utilsService.traformToInt(element, 0);
  }

  getDescrizione(String element, int index) {
    UtilsService utilsService = Injector().get<UtilsService>();
    return utilsService.getSubstring(element, index);
  }


}
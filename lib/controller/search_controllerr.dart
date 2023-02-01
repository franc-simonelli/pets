import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/model/cat_model.dart';
import 'package:petsguide/screen/details/cat_details_screen.dart';
import 'package:petsguide/service/firebase_query_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {

  RxList<Cats> listCatsCronologia = <Cats>[].obs;
  RxList<Cats> listCatByRazza = <Cats>[].obs;

  Future getCatByCronologia(idCat) async{
    FirebaseQueryService firebaseQueryService = Injector().get<FirebaseQueryService>();
    final CatController catController = Get.put(CatController());
    RxList<Cats> list = catController.getCatsList();
    var cat = await firebaseQueryService.getCatByIdInList(idCat, list.value);
    catController.setCatSelect(cat);
    Get.to(CatDetailsScreen());
  }

  isExistInList(string, list) {
    bool isExist = false;
    for(int i=0; i < list.length; i++) {
      if(string == list[i].razza) {
        isExist = true;
        break;
      }
    }

    return isExist;
  }

  saveSceltaInStorage(Cats cat) async {
    if(!isExistInList(cat.razza, listCatsCronologia)) {
      final prefs = await SharedPreferences.getInstance();
      Cats newCat = Cats(id: cat.id, razza: cat.razza);
      listCatsCronologia.add(newCat);
      final String encodedData = Cats.encode(listCatsCronologia);
      await prefs.setString('cronologia', encodedData);
    }    
  }

  getCronologia() async {
    listCatsCronologia.value = [];
    final prefs = await SharedPreferences.getInstance();
    final String? cronologiaString = prefs.getString('cronologia');
    if(cronologiaString!.isNotEmpty) {
       listCatsCronologia.value = Cats.decode(cronologiaString);
    }
    listCatsCronologia.refresh();
  }

  deleteFromCronologia(cat) async {
    listCatsCronologia.remove(cat);
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = Cats.encode(listCatsCronologia);
    await prefs.setString('cronologia', encodedData);

    listCatsCronologia.refresh();
  }

  searchByRazza(razza) async {
    if(razza != ''){
      listCatByRazza.value = [];
      final CatController catController = Get.put(CatController());
      RxList<Cats> list = catController.getCatsList();
      list.forEach((element) {
        String razzaLowerCase = razza.toLowerCase();
        if(element.razza!.toLowerCase().contains(razzaLowerCase)) {
          listCatByRazza.add(element);
        }
       });
    } else {
      listCatByRazza.value = [];
    }
    listCatByRazza.refresh();
    
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petsguide/model/cat_model.dart';

class FirebaseQueryService {

  getCats() async {
    List<Cats> catsList = [];
    await FirebaseFirestore.instance
        .collection('cats')
        .get().then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) { 
            Cats cat = Cats(
              id: doc.reference.id,
              razza: doc['razza'],
              descrizione: doc['descrizione'],
              image: doc['image'],
              imageCarousel: doc['imageCarousel'],
              origine: doc['origine'],
              paese: doc['paese'],
              mantello: doc['mantello'],
              taglia: doc['taglia'],
              vita: doc['vita'],
              carattere: doc['carattere'],
              aspettiPrincipali:  doc['aspettiPrincipali'],
              imageVertical: doc['imageVertical'],
              salute:  doc['salute'],
              allevamento: doc['allevamento'],
              alimentazione: doc['alimentazione'],
            );
            catsList.add(cat);
          });
        });
        return catsList;
  }

  getCatByIdInList(idCat, list) async {
    var cat;
    list.forEach((element) { 
      if(idCat == element.id) {
        cat = element;
      }
    });
    return cat;
  }

  mapCatPreferitiByAll(listIdPreferiti, listAll) {
    List<Cats> listaPreferiti = [];
    listIdPreferiti.forEach((element) {
      listAll.forEach((elementListAll) {
        if(elementListAll.id == element) {
          listaPreferiti.add(elementListAll);
        }
      });
    });

    return listaPreferiti;
  }
}
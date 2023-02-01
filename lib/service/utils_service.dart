
import 'package:petsguide/model/cat_model.dart';

class UtilsService {
  
  getSubstring(string, index) {
    return string.substring(index);
  }

  traformToInt(element, index) {
    return int.parse(element[index]);
  }

  controlIsListAllHorizontalImage(List<Cats> list) {
    
    bool isAllHorizontal = true;

    for(int i=0; i<list.length; i++) {
      if(list[i].imageVertical!) {
        isAllHorizontal = false;
        break;
      }
    }
    return isAllHorizontal;
  }

}
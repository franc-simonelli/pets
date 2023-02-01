import 'package:get/get.dart';

class CarouselControllerHome extends GetxController {
  RxInt currentIndex = 0.obs;

  setCurrentIndex(index) {
    currentIndex.value = index;
    currentIndex.refresh();
  }
}
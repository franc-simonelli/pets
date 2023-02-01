import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petsguide/model/tab_model.dart';

class TabControllerChange extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'LEFT'),
    const Tab(text: 'RIGHT'),
  ];

  final List<TabModel> tab = [
    TabModel(id: '1', icon: FontAwesomeIcons.house, text: 'Origine'),
    TabModel(id: '2', icon: FontAwesomeIcons.book, text: 'Descrizione'),
    TabModel(id: '3', icon: FontAwesomeIcons.temperatureFull, text: 'Carattere'),
    TabModel(id: '4', icon: FontAwesomeIcons.heart, text: 'Salute'),
    TabModel(id: '5', icon: FontAwesomeIcons.utensils, text: 'Alimentazione'),
    TabModel(id: '6', icon: FontAwesomeIcons.tractor, text: 'Allevamento'),
    TabModel(id: '7', icon: FontAwesomeIcons.circleExclamation, text: 'Aspetti'),
  ];

  RxInt tabIndex = 0.obs;

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  changeTabIndex(index) {
    tabIndex.value = index;
    tabIndex.refresh();
  }
}
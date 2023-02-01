import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/screen/widget/app_bar_widget.dart';
import 'package:petsguide/screen/widget/build_cat_widget.dart';

class PreferitiScreen extends StatelessWidget {
  const PreferitiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CatController catController = Get.put(CatController());
    var theme = Theme.of(context);
    catController.getListCatPreferiti();

    return Scaffold(
      appBar: AppBarWidget('I tuoi preferiti'),
      body: Obx(() {
        return GridView.builder(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.65
          ),
          itemCount: catController.listCatPreferiti.length,
          itemBuilder: (context, index) {
            var cat = catController.listCatPreferiti[index]; 
            return BuildCatWidget(cat);
          },
        );
      })
    );
  }
}
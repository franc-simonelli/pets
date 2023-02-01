// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/controller/login_controller.dart';
import 'package:petsguide/screen/details/cat_details_screen.dart';
import 'package:petsguide/screen/drawer/drawer_widget.dart';
import 'package:petsguide/screen/home/widget/carousel_widget.dart';
import 'package:petsguide/screen/home/widget/image_widget.dart';
import 'package:petsguide/screen/widget/build_cat_widget.dart';
import 'package:petsguide/service/utils_service.dart';

import 'widget/app_bar_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CatController catController = Get.put(CatController());
    final LoginController loginController = Get.put(LoginController());
    loginController.getUser();
    catController.getCats();
    
    var theme = Theme.of(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    openDrawerFunction() {
      _scaffoldKey.currentState!.openEndDrawer();
    }

    return Scaffold(
      
      key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(function: () {openDrawerFunction();}),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                const CarouselWidget(),                
                const SizedBox(height: 0,),
                titleWidget(theme, 'Mantello', 'Pelo corto'),
                const SizedBox(height: 20,),
                Obx(() {
                  return SizedBox(
                    height: 275,
                    child: buildListView(catController.catsListCorto, theme, catController),
                  );
                
                },),
                const SizedBox(height: 10,),
                titleWidget(theme, 'Mantello', 'Pelo medio'),
                const SizedBox(height: 10,),
                Obx(() {
                  return SizedBox(
                    height: 275,
                    child: buildListView(catController.catsListMedio, theme, catController),
                  );
                },),
                const SizedBox(height: 10,),
                titleWidget(theme, 'Mantello', 'Pelo lungo'),
                const SizedBox(height: 10,),
                Obx(() {
                  return SizedBox(
                    height: 275,
                    child: buildListView(catController.catsListLungo, theme, catController),
                  );
                },),
              ]
            ),
          )
        ],
        
      )
    );
  }

  
  
  Widget titleWidget(ThemeData theme, categoria, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(categoria, style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey.shade600, fontSize: 15, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(width: 5, height: 5, decoration: BoxDecoration(shape: BoxShape.circle, color: theme.secondaryHeaderColor),),
          ),
          Text(value, style: theme.textTheme.labelMedium!.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget buildListView(list, ThemeData theme, CatController catController) {
    return ListView.builder(
      // padding: const EdgeInsets.only(left: 5, top: 10),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            catController.setCatSelect(list[index]);
            Get.to(const CatDetailsScreen());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: BuildCatWidget(list[index])
          )
        );
      }
    );
  }
}
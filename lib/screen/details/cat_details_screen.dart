// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, sort_child_properties_last, unnecessary_new, non_constant_identifier_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/constants/images.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/controller/tab_controller.dart';
import 'package:petsguide/model/caratteristiche_model.dart';
import 'package:petsguide/screen/details/widget/information_cat_widget.dart';
import 'package:petsguide/screen/widget/cached_network_images.dart';
import 'package:petsguide/screen/widget/html_text.dart';

class CatDetailsScreen extends StatelessWidget {
  const CatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CaratteristicheModel> caratteristiche = [];
    var theme = Theme.of(context);
    final CatController catController = Get.put(CatController());
    caratteristiche = catController.caratteristiche;

    return Scaffold(
      body: CustomScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          sliver_app_bar_widget(context, theme, catController),
          sliver_list_widget(catController, theme, caratteristiche)
        ]
      )
    );
  }

  Widget sliver_list_widget(CatController catController, ThemeData theme, List<CaratteristicheModel> caratteristiche) {
    final TabControllerChange tabController = Get.put(TabControllerChange());
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Obx(() {
            return Center(
              child: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HtmlText(catController.catSelected.value!.origine!),
                  // child: Text(catController.catSelected.value!.origine!, style: theme.textTheme.headlineMedium, textAlign: TextAlign.justify ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HtmlText(catController.catSelected.value!.descrizione!),
                  // child: Text(catController.catSelected.value!.descrizione!, style: theme.textTheme.headlineMedium, textAlign: TextAlign.justify),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HtmlText(catController.catSelected.value!.carattere!),
                  // child: Text(catController.catSelected.value!.carattere!, style: theme.textTheme.headlineMedium, textAlign: TextAlign.justify),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HtmlText(catController.catSelected.value!.salute!),
                  // child: Text(catController.catSelected.value!.carattere!, style: theme.textTheme.headlineMedium, textAlign: TextAlign.justify),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HtmlText(catController.catSelected.value!.alimentazione!),
                  // child: Text(catController.catSelected.value!.carattere!, style: theme.textTheme.headlineMedium, textAlign: TextAlign.justify),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HtmlText(catController.catSelected.value!.allevamento!),
                  // child: Text(catController.catSelected.value!.carattere!, style: theme.textTheme.headlineMedium, textAlign: TextAlign.justify),
                ),      
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: caratteristiche.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(caratteristiche[index].descrizione!, style: theme.textTheme.labelMedium!.copyWith(fontSize: 16, color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Row(
                              
                              children: [
                                for(int i=0; i<5; i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2),
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset('contents/images/logo_zampa.png', color: i < caratteristiche[index].punteggio! ? theme.primaryColor : Colors.grey,),
                                    ),
                                  )
                              ],
                            )                                
                          ],
                        ),
                      );
                    })
                  )
                )  
              ]
              [tabController.tabIndex.value],
            );
          }),
        ]
      ),
    );
  }

  Widget sliver_app_bar_widget(BuildContext context, ThemeData theme, CatController catController) {
    final TabControllerChange tabController = Get.put(TabControllerChange());
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      pinned: true,
      snap: false,
      stretch: true,
      // floating: false,
      expandedHeight: MediaQuery.of(context).size.width*1.3,
      leading: Icon(Icons.arrow_back, color: Colors.transparent,),
      flexibleSpace: flexibleWidget(theme, catController),
      bottom: bottomAppBarWidget(theme, tabController),
    );
  }

  PreferredSize bottomAppBarWidget(ThemeData theme, TabControllerChange tabController) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        color: theme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabController.tab.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {tabController.changeTabIndex(index);},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(() {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(tabController.tab[index].icon, color: tabController.tabIndex.value == index ? theme.primaryColor : theme.secondaryHeaderColor,), 
                              SizedBox(height: 10),
                              Text(tabController.tab[index].text!, style: theme.textTheme.bodySmall!.copyWith(color: tabController.tabIndex.value == index ? theme.primaryColor : theme.secondaryHeaderColor),)
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                );
              },
            )
          ),
        ),
      )
    );
  }

  // FlexibleSpaceBar flexibleWidget(ThemeData theme, CatController catController) {

  //   return FlexibleSpaceBar(
  //     background: Obx(() {
  //       return Container(
  //         decoration: BoxDecoration(
  //           color: theme.backgroundColor,      
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.only(bottom: 80),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(35),
  //               color: theme.primaryColor.withOpacity(0.3),
  //               image: DecorationImage( 
  //                 image: NetworkImage(catController.catSelected.value!.image!, scale: 0.5),
  //               ),
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.only(bottom: 0),
  //               child: InformationCatWidget(),
  //             ),
  //           ),
  //         ),
  //       );
  //     })
  //   );
  // }

  FlexibleSpaceBar flexibleWidget(ThemeData theme, CatController catController) {
    const Size cacheMaxSize = Size(700, 700);
    final ImageProvider placeholder = AppImages.bulbasaur;
    return FlexibleSpaceBar(
      background: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,      
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: theme.primaryColor.withOpacity(0.3),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CachedNetWorkImageWidget(catController.catSelected.value!.image!)
                  ),
                  InformationCatWidget()
                ]
              ),
            ),          
          ),
        );
      })
    );
  }
}
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/screen/details/widget/bottom_sheet.dart';

class ImageDetailsWidget extends StatelessWidget {
  const ImageDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CatController catController = Get.put(CatController());
    // final PunteggioController punteggioController = Get.put(PunteggioController());
    var theme = Theme.of(context);

    return Obx(() {
      return Container(
        height: MediaQuery.of(context).size.width * 1.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(35),
          image: DecorationImage( 
            image: NetworkImage(catController.catSelected.value!.image!, ),
          ),
        ),
        child: informationWidget(context, catController, theme),
      );
    });
  }

  Widget informationWidget(BuildContext context, CatController catController,ThemeData theme) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(36),
            ),
            child: SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(catController.catSelected.value!.razza!, style: theme.textTheme.titleLarge),
                          ],
                        ),
                        SizedBox(height: 5),
                        buildRow(
                          theme, 
                          FontAwesomeIcons.heartbeat, 
                          'Vita media: ', 
                          catController.catSelected.value!.vita!
                        ),                      
                        SizedBox(height: 5),
                        buildRow(
                          theme, 
                          Icons.open_in_full_outlined, 
                          'Taglia', 
                          catController.catSelected.value!.taglia!
                        ),
                        SizedBox(height: 5),
                        buildRow(
                          theme, 
                          Icons.category, 
                          'Mantello: ', 
                          catController.catSelected.value!.mantello!
                        ),                
                        SizedBox(height: 5),
                        buildRow(
                          theme, 
                          FontAwesomeIcons.globe, 
                          'Paese: ', 
                          catController.catSelected.value!.paese!
                        ), 
                        SizedBox(height: 10),
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Row(
                        //     children: [
                        //       SimpleTags(
                        //         content: catController.tagCat,
                        //         wrapSpacing: 10,
                        //         wrapRunSpacing: 6,
                        //         tagContainerPadding: EdgeInsets.all(5),
                        //         tagTextStyle: theme.textTheme.titleSmall,
                        //         tagContainerDecoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(8),
                        //           color: theme.primaryColor.withOpacity(0.7),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 25,
                                  color: Color.fromARGB(255, 248, 140, 45),
                                ),
                                SizedBox(width: 5),
                                // catController.punteggioMedio.value != 0.0
                                // ?
                                Text(catController.punteggioMedio.value.toString(), style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.white))
                                // :
                                // Text('Ancora nessun voto', style: theme.textTheme.titleMedium!.copyWith(color: Colors.white))
                              ],
                            ),
                            
                          ],
                        ),       
                      ],
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: (() {
                          catController.getPunteggioAttualeByUser();
                          Get.bottomSheet( 
                            BottomSheetWidget()
                          );
                        }),
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: theme.primaryColor.withOpacity(0.8),
                          ),
                          child: Center(
                            child: Text('Vota', style: theme.textTheme.titleMedium),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: (() {}),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: theme.primaryColor.withOpacity(0.8),
                          ),
                          child: Icon(FontAwesomeIcons.heart)
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          )
        ),
      )              
    );
  }

  Widget buildRow(theme, icon, label, value) {
    return Row(
      children: [
        Icon(icon, color: theme.primaryColor, size: 17),
        SizedBox(width: 10),
        Text(label, style: theme.textTheme.titleMedium),
        Text(value, style: theme.textTheme.titleSmall)
       
      ],
    );
  }
}
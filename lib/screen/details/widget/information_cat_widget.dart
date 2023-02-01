import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/screen/details/widget/bottom_sheet.dart';

class InformationCatWidget extends StatelessWidget {
  const InformationCatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final CatController catController = Get.put(CatController());
    
    return Obx(() {
      
    
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
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(catController.catSelected.value!.razza!, style: theme.textTheme.labelLarge),
                            ],
                          ),
                          const SizedBox(height: 5),
                          buildRow(
                            theme, 
                            FontAwesomeIcons.heartbeat, 
                            'Vita media: ', 
                            catController.catSelected.value!.vita!
                          ),                      
                          const SizedBox(height: 5),
                          buildRow(
                            theme, 
                            Icons.open_in_full_outlined, 
                            'Taglia: ', 
                            catController.catSelected.value!.taglia!
                          ),
                          const SizedBox(height: 5),
                          buildRow(
                            theme, 
                            Icons.category, 
                            'Mantello: ', 
                            catController.catSelected.value!.mantello!
                          ),                
                          const SizedBox(height: 5),
                          buildRow(
                            theme, 
                            FontAwesomeIcons.globe, 
                            'Paese: ', 
                            catController.catSelected.value!.paese!
                          ), 
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 25,
                                    color: Color.fromARGB(255, 250, 142, 47),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(catController.punteggioMedio.value.toString(), style: theme.textTheme.labelLarge!)
                                ],
                              ),
                              
                            ],
                          ),       
                        ],
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: InkWell(
                          onTap: (() async{
                            await catController.getPunteggioAttualeByUser();
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
                              child: Text('Vota', style: theme.textTheme.labelMedium!.copyWith(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            catController.setCatPreferito();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: theme.primaryColor.withOpacity(0.8),
                            ),
                            child: Icon(FontAwesomeIcons.heart, color: Colors.white,)
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
  });
  }
  Widget buildRow(theme, icon, label, value) {
    return Row(
      children: [
        Icon(icon, color: theme.primaryColor, size: 17),
        SizedBox(width: 10),
        Text(label, style: theme.textTheme.labelMedium.copyWith(color: Colors.white)),
        Text(value, style: theme.textTheme.labelMedium.copyWith(color: Colors.white))
       
      ],
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/carousel_controller.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/screen/details/cat_details_screen.dart';
import 'package:petsguide/screen/widget/cached_network_images.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final CarouselControllerHome carouselController = Get.put(CarouselControllerHome());
    final CatController catController = Get.put(CatController());
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        children: [
          Obx(() {              
            return CarouselSlider(
              options: CarouselOptions(
                scrollPhysics: BouncingScrollPhysics(),
                viewportFraction: 1.0,
                aspectRatio: 1.8,
                autoPlay: true,
                onPageChanged: ((index, reason) {
                  carouselController.setCurrentIndex(index);
                })             
              ),
              items: catController.catsCarousel
                .map((item) =>
                  GestureDetector(
                    onTap: () {
                      catController.setCatSelect(item);
                      Get.to(CatDetailsScreen());
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              image: DecorationImage(
                                image: NetworkImage(item.imageCarousel!),
                                fit: BoxFit.cover
                              ),
                            ),
                            // child: ClipRect(child: CachedNetWorkImageWidget(item.imageCarousel!)),
                            
                          ),
                          
                        ),
       
                      ]
                    ),
                  ),
                ).toList(),
            );
          }),
          
          Obx(() {
            var currentIndex = carouselController.currentIndex.value;
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  height: 10,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection:Axis.horizontal,
                    itemCount: catController.catsCarousel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AnimatedContainer(
                          duration:Duration(milliseconds: 200),
                          width: carouselController.currentIndex.value == index ? 20 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == index ? theme.primaryColor : theme.secondaryHeaderColor
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
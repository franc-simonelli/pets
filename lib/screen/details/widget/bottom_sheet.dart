import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/screen/widget/loading_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CatController catController = Get.put(CatController());
    var theme = Theme.of(context);

    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: theme.backgroundColor
      ),
      child:Column(
        children: [
          const SizedBox(height: 20),
          Text('Vota questo micio!', style: theme.textTheme.displayMedium ),
          const SizedBox(height: 20),
          Obx(() {
            return RatingBar.builder(
              unratedColor: Colors.grey,
              itemSize: 40,
              initialRating: catController.initialRating.value,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color.fromARGB(255, 248, 140, 45),
              ),
              onRatingUpdate: (rating) {
                catController.setRatingSelected(rating);
              },
            );
          }),
          const SizedBox(height: 40),
          
          GestureDetector(
            onTap: () async {
              await catController.setPunteggio();
              Get.back();
            },
            child: Obx(() {
              return catController.loadingPunteggio.value
              ?
              const LoadingWidget(100.0)
              :
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: theme.primaryColor
                ),
                child: Center(child: Text('Conferma', style: theme.textTheme.labelLarge)),
              );
            }),
          )
        ],
      )
    );
  }
}
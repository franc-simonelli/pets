import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:petsguide/constants/images.dart';
import 'package:petsguide/screen/widget/cached_network_images.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.cat, {super.key});

  final cat;
  static const Size cacheMaxSize = Size(700, 700);
  final ImageProvider placeholder = AppImages.bulbasaur;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     image: DecorationImage(
    //       opacity: 1.0,
    //       image: NetworkImage(cat.image!),
    //     ),
    //   ),
    // );

    return CachedNetWorkImageWidget(cat.image);
  }
}
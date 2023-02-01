import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:petsguide/constants/images.dart';

class CachedNetWorkImageWidget extends StatelessWidget {
  const CachedNetWorkImageWidget(this.image,{super.key});
  final image;

  @override
  Widget build(BuildContext context) {
    const Size cacheMaxSize = Size(700, 700);
    final ImageProvider placeholder = AppImages.bulbasaur;
    return CachedNetworkImage(
        imageUrl: image,
        imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
        useOldImageOnUrlChange: true,
        maxWidthDiskCache: cacheMaxSize.width.toInt(),
        maxHeightDiskCache: cacheMaxSize.height.toInt(),
        fadeInDuration: Duration(milliseconds: 120),
        fadeOutDuration: Duration(milliseconds: 120),
        imageBuilder: (_, image) => Image(
          image: image,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
        ),
        
        placeholder: (_, __) => Image(
          image: placeholder,
          // width: 100,
          // height: 100,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          fit: BoxFit.contain,
        ),
        errorWidget: (_, __, ___) => Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: placeholder,
              // width: 100,
              // height: 100,
              color: Colors.black12,
            ),
            Icon(
              Icons.warning_amber_rounded,
              size: 500 * 0.3,
              color: Colors.black26,
            ),
          ],
        ),
      );
  }
}
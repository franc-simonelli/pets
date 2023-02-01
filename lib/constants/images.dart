// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

const String _imagePath = 'contents/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const bulbasaur = _Image('logo.png');
 

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(bulbasaur, context);
  }

  
}

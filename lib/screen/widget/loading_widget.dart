import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(this.width, {super.key});
  final width;

  @override
  Widget build(BuildContext context) {
    return Image.asset('contents/images/loading_gif.gif', width: width);
    
  }
}
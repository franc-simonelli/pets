// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(this.width, this.height, this.radius, this.color, this.colorBorder, this.child, {super.key});

  final width, height, radius, color, colorBorder, child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
        borderRadius: BorderRadius.circular(radius),
        color: color
      ),
      child: child
    );
  }
}
import 'package:flutter/material.dart';

class BuildButtonWidget extends StatelessWidget {
  const BuildButtonWidget(this.child, {super.key});

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400, width: 1)
      ),
      child: child
    );
  }
}
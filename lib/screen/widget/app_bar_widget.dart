import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget(this.title, {super.key});
  final title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppBar(
      leading: GestureDetector(
        onTap: (() {
          Get.back();
        }),
        child: Icon(Icons.arrow_back_ios_new, color: theme.secondaryHeaderColor,)
      ),
      // backgroundColor: theme.backgroundColor,
      title: Text(title, style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
      centerTitle: true, 
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/login_controller.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final LoginController loginController = Get.put(LoginController());

    return Obx(() {  
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            build_avatar_widget(context, loginController, theme),
            const SizedBox(height: 10),
            Text(loginController.user.value!.email!, style: theme.textTheme.bodySmall,),
            const SizedBox(height: 20),
            Divider(color: theme.secondaryHeaderColor, indent: 30, endIndent: 30, thickness: 1,),
          ],
        ),
      );
    });
  
  }

  Widget build_avatar_widget(BuildContext context, LoginController loginController, ThemeData theme) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        children: [ 
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.grey.shade800 : Colors.grey.shade100,
            ),
            child: Center(
              child: Text(loginController.userInitial.value, style: theme.textTheme.titleSmall!.copyWith(color: theme.backgroundColor),),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
                border: Border.all(color: theme.backgroundColor, width: 2)
              ),
              child: const Icon(Icons.add, color: Colors.white,),
            ),
          ),
        ] 
      ),
    );
  }
}
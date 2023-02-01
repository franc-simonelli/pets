// ignore_for_file: empty_catches, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/login_controller.dart';
import 'package:petsguide/screen/login/login_screen.dart';
import 'package:petsguide/screen/preferiti/preferiti_screen.dart';
import 'package:petsguide/screen/punteggi/punteggi_screen.dart';
import 'package:petsguide/test/login_test.dart';
import 'package:petsguide/screen/init_screen/init_screen.dart';

import 'widget/user_info_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    var theme = Theme.of(context);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UserInfo(),
          build_option_widget(theme),
          
          build_logout_widget(theme, loginController)
        ],
      ),
    );
  }

  Widget build_logout_widget(ThemeData theme, loginController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              Get.defaultDialog(
                backgroundColor: theme.backgroundColor,
                title: '',
                middleTextStyle: theme.textTheme.labelMedium,
                radius: 30,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    const Icon(FontAwesomeIcons.circleQuestion, size: 40,),
                    const SizedBox(height: 40),
                    Text('Sei sicuro di voler uscire?', style: theme.textTheme.bodyMedium,),
                    const SizedBox(height: 80),

                    Column(
                      children: [
                        const Divider(),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () async{
                            try{
                              await loginController.signOut();
                              Get.offAll(const InitScreen());
                            }
                            catch(err){
                            }
                          },
                          child: Text('Conferma', style: theme.textTheme.bodySmall)
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: (() {
                            Get.back();
                          }),
                          child: Text('Annulla', style: theme.textTheme.bodySmall)
                        )
                      ],
                    )
                  ],
                ),
          
                
              );
            },
            child: Text('Logout', style: theme.textTheme.bodySmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }

  Widget build_option_widget(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const PreferitiScreen());
              },
              child: build_row_widget(theme, Icons.favorite, 'I tuoi preferiti')
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(const PunteggiScreen());
              },
              child: build_row_widget(theme, Icons.star, 'I tuoi punteggi')
            ),
          ],
        ),
      ),
    );
  }

  Widget build_row_widget(theme, icon, label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: theme.primaryColor,),
        const SizedBox(width: 20,),
        Text(label, style: theme.textTheme.displayMedium)
      ],
    );
  }

  
}
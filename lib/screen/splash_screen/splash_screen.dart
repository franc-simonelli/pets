// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:petsguide/screen/home/home_screen.dart';
import 'package:petsguide/service/secure_service.dart';
import 'package:petsguide/screen/init_screen/init_screen.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  late Timer timer;
  late bool isLogged = false;
  
  init(context)async {
    SecureService _secureService = Injector().get<SecureService>();
    isLogged = await _secureService.isLogged();

    timer = Timer(
      const Duration(seconds: 3),() {
        if(isLogged) {
          Get.off(const HomeScreen());
        } else {
          Get.off(const InitScreen());
        }
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('contents/images/logo.png', height: 80,),
            Text('Gattolandia', style: theme.textTheme.displaySmall)
          ],
        ),
      ),    
    );
  }
}


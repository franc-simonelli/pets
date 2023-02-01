import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:petsguide/model/logged_user_mode.dart';
import 'package:petsguide/screen/home/home_screen.dart';
import 'package:petsguide/service/secure_service.dart';

class RegisterController extends GetxController{
  
  String email = '';
  String password = '';
  String confermaPassword = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  setEmail(email) {
    email = email;
  }

  setPassword(password) {
    password = password;
  }

  setConfermaPassword(confermaPassword) {
    confermaPassword = confermaPassword;
  }

  Future signUp(email, password) async{
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      LoggedUser user = LoggedUser();
      user.email = result.user!.email;
      user.userId = result.user!.uid;
      user.emailVerified = result.user!.emailVerified;
      SecureService secureService = Injector().get<SecureService>();
      await secureService.setLoggedUser(user);
      Get.offAll(const HomeScreen());
      //Get.snackbar('OK', 'OK');
    }
    on FirebaseAuthException catch (e) {
      Get.snackbar('Errore', e.message.toString());
    }

  }
}
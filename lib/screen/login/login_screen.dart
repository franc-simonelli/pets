// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/login_controller.dart';
import 'package:petsguide/screen/home/home_screen.dart';
import 'package:petsguide/screen/login/widget/build_button.widget.dart';
import 'package:petsguide/screen/widget/button_widget.dart';
import 'package:petsguide/screen/widget/loading_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final LoginController loginController = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    var themeLight = MediaQuery.platformBrightnessOf(context) == Brightness.light ? true : false;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 50),
                Text('Bentornato!', style: theme.textTheme.titleSmall),
                const SizedBox(height: 25),
                // EMAIL FIELD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    // style: theme.textTheme.bodySmall,
                    style: theme.textTheme.bodyMedium,
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(  
                      filled: true,
                      hintText: 'Email',
                    ),
                    onSaved: (value) {
                      loginController.setEmail(value ?? "");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Inserire l'email";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // PASSWORD FIELD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                    ),
                    onSaved: (value) {
                      loginController.setPassword(value ?? "");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserire la password';
                      } 
                      
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // FORGOT PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot password?', style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey.shade600)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // SIGNIN BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        loginController.loginWithEmailAndPassword(emailController.text, passwordController.text);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('Sign In', style: theme.textTheme.labelMedium!.copyWith(color: Colors.white)),
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 50),
                // OR CONTINUE WITH
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text('Or continue with', style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey.shade600)),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // GOOGLE BUTTON
                GestureDetector(
                  onTap: () async {
                    try{
                      await loginController.signInwithGoogle();
                      Get.off(HomeScreen());
                    }
                    on FirebaseAuthException catch (e) {
                      Get.snackbar('Errore', e.message.toString());
                    }
                  },
                  child: Obx(() {
                    return loginController.loadingGoogle.value
                    ?
                    LoadingWidget(100.0)
                    :
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: themeLight ?Colors.white : Colors.grey.shade600),
                        color: themeLight ? Colors.grey.shade200 : Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:Image.asset('contents/images/google_logo.png', height: 40,),
                      )
                    );
                  }),
                ),
              ],
            ),
          ),
        )
      )
    
  );
  }

 }
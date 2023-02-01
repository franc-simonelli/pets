import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/login_controller.dart';
import 'package:petsguide/screen/home/home_screen.dart';
import 'package:petsguide/screen/widget/button_widget.dart';

class LoginTEST extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final LoginController loginController = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 50),
                Text('Bentornato!', style: theme.textTheme.labelSmall),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade700),
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey.shade500)
                    ),
                    onSaved: (value) {
                      // registerController.setEmail(value ?? "");
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade700),
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey.shade500)
                    ),
                    onSaved: (value) {
                      // registerController.setPassword(value ?? "");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserire la password';
                      } 
                      
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot password?', style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey.shade600, fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        loginController.loginWithEmailAndPassword(emailController.text, passwordController.text);
                      }
                    },
                    child: ButtonWidget(
                      MediaQuery.of(context).size.width,
                      50.0,
                      10.0,
                      theme.primaryColor,
                      Colors.transparent,
                      Center(child: Text('Sign In', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  )
                ),
                const SizedBox(height: 50),
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
                      Text('Or continue with', style: theme.textTheme.labelSmall!.copyWith(fontSize: 13, color: Colors.grey.shade700)),
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('contents/images/google_logo.png', height: 40,),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


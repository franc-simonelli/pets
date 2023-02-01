import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/login_controller.dart';

class FormFieldTest extends StatelessWidget {
  const FormFieldTest(this.controller, this.obscureText, this.hintText, this.isEmail, this.isPassword,{super.key});

  final controller;
  final obscureText;
  final hintText;
  final isEmail;
  final isPassword;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500)
      ),
      onSaved: (value) {
        isEmail 
        ?
        loginController.setEmail(value ?? "")
        :
        isPassword
        ?
        loginController.setPassword(value ?? "")
        :
        null;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Inserire al password';
        }
        return null;
      },
    );
  }
}
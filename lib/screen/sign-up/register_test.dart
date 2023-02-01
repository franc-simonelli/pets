import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/register_controller.dart';

class RegisterTEST extends StatelessWidget {
  RegisterTEST({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confermaPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final RegisterController registerController = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>();

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
                Text('Crea un account!', style: theme.textTheme.titleSmall),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    style: theme.textTheme.bodyMedium,
                    controller: emailController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Email',
                    ),
                    onSaved: (value) {
                      registerController.setEmail(value ?? "");
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Password',
                    ),
                    onSaved: (value) {
                      registerController.setPassword(value ?? "");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserire la password';
                      } 
                      if((value.isNotEmpty && confermaPasswordController.text.isNotEmpty) && 
                        (value != confermaPasswordController.text)) {
                        return 'Le password non coincidono';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    style: theme.textTheme.displaySmall!.copyWith(fontSize: 18),
                    controller: confermaPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Conferma password',
                    ),
                    onSaved: (value) {
                      registerController.setConfermaPassword(value ?? "");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Conferma la password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        registerController.signUp(emailController.text, passwordController.text);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('Sign Up', style: theme.textTheme.labelMedium!.copyWith(color: Colors.white),),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
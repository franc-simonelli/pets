import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/screen/login/login_screen.dart';
import 'package:petsguide/screen/widget/button_widget.dart';
import 'package:petsguide/screen/sign-up/register_test.dart';
import 'package:petsguide/screen/widget/loading_widget.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('contents/images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.1), BlendMode.colorDodge)
          )
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(40))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(child: Text('Scopri e vota le razze dei gatti!', style: theme.textTheme.titleMedium, maxLines: 2,))
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: ButtonWidget(
                      MediaQuery.of(context).size.width,
                      45.0,
                      10.0,
                      theme.primaryColor,
                      Colors.transparent,
                      Center(child: Text('Sign In', style: theme.textTheme.labelMedium!.copyWith(color: Colors.white),))
                    ),
                  ),        
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterTEST());
                        },
                        child: Text('Or Create Account', style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold))),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_right_alt)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
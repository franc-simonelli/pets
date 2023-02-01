import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:petsguide/constants/theme.dart';
import 'package:petsguide/screen/splash_screen/splash_screen.dart';
import 'package:petsguide/service/firebase_query_service.dart';
import 'package:petsguide/service/login_google_service.dart';
import 'package:petsguide/service/secure_service.dart';
import 'package:petsguide/service/utils_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ModuleContainer().initialise(Injector());
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeLight,
      darkTheme: MyTheme.themeDark,
      home: SplashScreen(),
    );
  }
}

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<LoginGoogleService>((i) => LoginGoogleService(), isSingleton: false);
    injector.map<SecureService>((i) => SecureService(), isSingleton: false);
    injector.map<UtilsService>((i) => UtilsService(), isSingleton: false);
    injector.map<FirebaseQueryService>((i) => FirebaseQueryService(), isSingleton: false);
    
    return injector;
  }
}

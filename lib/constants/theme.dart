// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  static Color orange =const Color(0xFFFF9533);
  static Color blue = const Color(0xFF0C31B5);
  // static Color green = Color.fromARGB(255, 65, 109, 109);
  static Color green = Color.fromARGB(255, 35, 112, 84);

  static Color darkGrey = Colors.grey.shade800;
  static Color mediumGrey = Colors.grey.shade500;
  static Color lightGrey = Colors.grey.shade100;
  static Color black = Colors.black;
  static Color white = Colors.white;

  static Color backgroundColorLight = Colors.grey.shade300;
  static Color backgroundColorDark = Colors.grey.shade900;

  static List<BoxShadow> boxShadowLight = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(3,3),
      color: Colors.grey.shade400
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(-3,-3),
      color: Colors.grey.shade100
    )
  ];

  static List<BoxShadow> boxShadowDark = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(3,3),
      color: Colors.black
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(-4,-4),
      color: Colors.grey.shade900
    )
  ];


  static ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: backgroundColorDark,
    scaffoldBackgroundColor: backgroundColorDark,
    primaryColor: green,
    secondaryHeaderColor: mediumGrey,
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey.shade900
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
      ),
      fillColor: Colors.grey.shade800,
      hintStyle: TextStyle(color: Colors.grey.shade400)
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.roboto(textStyle: TextStyle(color: lightGrey, fontSize: 20, overflow: TextOverflow.ellipsis)),
      titleSmall: GoogleFonts.roboto(textStyle: TextStyle(color: lightGrey, fontSize: 17, overflow: TextOverflow.ellipsis)),

      
      bodyMedium: GoogleFonts.roboto(textStyle: TextStyle(color: lightGrey, fontSize: 18, overflow: TextOverflow.ellipsis)),
      bodySmall: GoogleFonts.roboto(textStyle: TextStyle(color: lightGrey, fontSize: 14, overflow: TextOverflow.ellipsis)),

      headlineMedium: GoogleFonts.roboto(textStyle: TextStyle(color: mediumGrey, fontSize: 16, fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.roboto(textStyle: TextStyle(color: green, fontSize: 14)),

      labelLarge: GoogleFonts.roboto(textStyle: TextStyle(color: white, fontSize: 20, overflow: TextOverflow.ellipsis)),
      labelMedium: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis)),
      labelSmall: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis)),

      displayMedium: GoogleFonts.roboto(textStyle: TextStyle(color: lightGrey, fontSize: 18, overflow: TextOverflow.ellipsis)),
      displaySmall: GoogleFonts.roboto(textStyle: TextStyle(color: green, fontSize: 15, overflow: TextOverflow.ellipsis)),
    ) 
  );

  static ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    backgroundColor: backgroundColorLight,
    scaffoldBackgroundColor: backgroundColorLight,
    primaryColor: green,
    secondaryHeaderColor: mediumGrey,
    drawerTheme: DrawerThemeData(
      backgroundColor: backgroundColorLight
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0
    ),
    inputDecorationTheme: InputDecorationTheme(  
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
      ),
      fillColor: Colors.grey.shade200,
      hintStyle: TextStyle(color: Colors.grey.shade500)
    ),
    
    textTheme: TextTheme(
      titleMedium: GoogleFonts.roboto(textStyle: TextStyle(color: darkGrey, fontSize: 20, overflow: TextOverflow.ellipsis)),
      titleSmall: GoogleFonts.roboto(textStyle: TextStyle(color: darkGrey, fontSize: 17, overflow: TextOverflow.ellipsis)),

      bodyMedium: GoogleFonts.roboto(textStyle: TextStyle(color: darkGrey, fontSize: 18, overflow: TextOverflow.ellipsis)),
      bodySmall: GoogleFonts.roboto(textStyle: TextStyle(color: darkGrey, fontSize: 14, overflow: TextOverflow.ellipsis)),
      
      headlineMedium: GoogleFonts.roboto(textStyle: TextStyle(color: green, fontSize: 16, fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.roboto(textStyle: TextStyle(color: mediumGrey, fontSize: 14)),
      
      labelLarge: GoogleFonts.roboto(textStyle: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
      labelMedium: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis)),
      labelSmall: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis)),


      displayMedium: GoogleFonts.roboto(textStyle: TextStyle(color: darkGrey, fontSize: 18, overflow: TextOverflow.ellipsis)),
      displaySmall: GoogleFonts.roboto(textStyle: TextStyle(color: darkGrey, fontSize: 15, overflow: TextOverflow.ellipsis)),
    )

    
  );
}
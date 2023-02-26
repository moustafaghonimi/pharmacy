import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: colorGreen,
    primaryColor: primaryColor,
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: onprimaryColor,
      error: Colors.red,
      onError: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      surface: Colors.black,
      onSurface:primaryColor,
      secondary: colorGreen,
      onSecondary: primaryColor,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor),elevation: MaterialStateProperty.all(3),
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
    subtitle1: TextStyle(
    fontSize: 20,
    color:Colors.black,
    ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    primaryColor: primaryDarkColor,
    colorScheme: ColorScheme(
      primary: primaryDarkColor,
      onPrimary: onprimaryDarkColor,
      error: Colors.red,
      onError: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      surface:Colors.white,
      onSurface: Colors.white,
      secondary: primaryDarkColor,
      onSecondary: primaryDarkColor,
      brightness: Brightness.light,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      highlightElevation: 3,
      splashColor: Colors.white,

      iconSize: 25,

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor),elevation: MaterialStateProperty.all(3),shadowColor: MaterialStateProperty.all(Colors.white)
        )
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: Color.fromRGBO(20, 25, 34, 1.0),
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black,
      elevation: 7
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontSize: 20,
        color:Colors.white,
      ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );}

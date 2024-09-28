import 'package:flutter/material.dart';

class DefaultTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffFFD634),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      displayLarge: TextStyle(
          color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffFFD634),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: const Color(0xff1E1E1E),
      brightness: Brightness.dark,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      fontFamily: 'Poppins',
      primaryTextTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        displayLarge: TextStyle(
            color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        displayLarge: TextStyle(
            color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ));
}

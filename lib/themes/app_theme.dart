import 'package:flutter/material.dart';

class AppTheme {
  // Define a primary and accent color scheme
  static final lightTheme = ThemeData(
    primaryColor: Colors.blueGrey[800],
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[900],
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
   
    buttonTheme: const ButtonThemeData(buttonColor: Colors.teal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.teal),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.blueGrey[900],
    scaffoldBackgroundColor: Colors.grey[850],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[800],
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    
    buttonTheme: const ButtonThemeData(buttonColor: Colors.tealAccent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.tealAccent),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[900],
      elevation: 6,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
  );
}
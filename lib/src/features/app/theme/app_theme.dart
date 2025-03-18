import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLigthTheme = Color.fromRGBO(95, 161, 209, 10);
  static const Color primaryDarkTheme = Color.fromRGBO(39, 47, 61, 5);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryLigthTheme,
    appBarTheme: const AppBarTheme(color: primaryLigthTheme, elevation: 0),
    scaffoldBackgroundColor: primaryLigthTheme,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryDarkTheme,
    appBarTheme: const AppBarTheme(color: primaryDarkTheme, elevation: 0),
    scaffoldBackgroundColor: primaryDarkTheme,
  );
}

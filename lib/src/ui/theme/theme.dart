import 'package:flutter/material.dart';

class DarkColor extends ColorScheme {
  const DarkColor()
      : super(
            brightness: Brightness.dark,
            primary: const Color(0xffe53277),
            onPrimary: const Color(0xffe53277),
            secondary: const Color(0xfffb5b5a),
            onSecondary: const Color(0xff272727),
            error: Colors.red,
            onError: Colors.red,
            background: const Color(0xff272727),
            onBackground: Colors.black,
            surface: const Color(0xff7c7a7a),
            onSurface: Colors.white);
}

class LightColor extends ColorScheme {
  const LightColor()
      : super(
            brightness: Brightness.dark,
            primary: const Color(0xffe53277),
            onPrimary: const Color(0xffe53277),
            secondary: const Color(0xfffb5b5a),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.white,
            onBackground: Colors.white,
            surface: const Color(0xffa0a5b9),
            onSurface: Colors.grey);
}

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white, colorScheme: const LightColor(),
    );
  }
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark, colorScheme: const LightColor(),
    );
  }
}

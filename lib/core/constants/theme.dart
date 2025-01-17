import 'package:flutter/material.dart';

// theme light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 246, 244, 244),
    onSurface: Color.fromARGB(255, 72, 62, 29),
    primary: Color.fromARGB(255, 162, 194, 226),
    onPrimary: Color(0xFFFFFFFF), // font color
    secondary: Color.fromARGB(255, 42, 10, 146),
    onSecondary: Color.fromARGB(255, 255, 255, 255),
    primaryContainer: Color.fromARGB(255, 162, 194, 226),
    // outline: const Color(0xffEBECF1),
    // secondaryContainer: const Color(0xfff43f5e),
    tertiary: Color.fromARGB(255, 162, 194, 226), //active
    tertiaryContainer: Color.fromARGB(255, 197, 197, 197), //inactive
  ),
);

// theme dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(),
);

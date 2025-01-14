import 'package:flutter/material.dart';

// theme light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 246, 244, 244),
    onSurface: Color.fromARGB(255, 72, 62, 29),
    primary: Color.fromARGB(255, 162, 194, 226),
    onPrimary: Color(0xFFFFFFFF), // font color
    secondary: Color.fromARGB(255, 162, 194, 226),
    onSecondary: Color.fromARGB(255, 162, 194, 226),
    // primaryContainer: const Color(0xff01DC82),
    // outline: const Color(0xffEBECF1),
    // secondaryContainer: const Color(0xfff43f5e),
    tertiaryContainer: Color.fromARGB(255, 246, 247, 247), //inactive
    tertiary: Color.fromARGB(255, 255, 250, 163), //active
  ),
);

// theme dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(),
);

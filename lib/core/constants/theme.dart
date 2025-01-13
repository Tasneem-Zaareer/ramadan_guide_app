import 'package:flutter/material.dart';

// theme light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 255, 255, 255),
    onBackground: Colors.brown.shade500,
    primary: Colors.brown.shade500,
    onPrimary: const Color(0xFFFFFFFF), // font color
    secondary: Colors.brown.shade100,
    onSecondary: Colors.brown.shade500,
    // primaryContainer: const Color(0xff01DC82),
    // outline: const Color(0xffEBECF1),
    // secondaryContainer: const Color(0xfff43f5e),
    // tertiaryContainer: const Color(0xFFDDDDDD),
    // tertiary: Colors.black,
  ),
);

// theme dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(),
);

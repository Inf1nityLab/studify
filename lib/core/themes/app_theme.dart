import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  static ThemeData getLightTheme() => LightTheme.theme;
  static ThemeData getDarkTheme() => DarkTheme.theme;
  
  static ThemeData getTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return getLightTheme();
      case Brightness.dark:
        return getDarkTheme();
    }
  }
} 
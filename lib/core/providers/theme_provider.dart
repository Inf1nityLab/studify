import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isLoading = false;

  ThemeMode get themeMode => _themeMode;
  bool get isLoading => _isLoading;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _loadThemeFromStorage();
  }

  Future<void> _loadThemeFromStorage() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final themeString = prefs.getString(AppConstants.themeKey);
      
      if (themeString == AppConstants.darkTheme) {
        _themeMode = ThemeMode.dark;
      } else if (themeString == AppConstants.lightTheme) {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.system;
      }
    } catch (e) {
      // В случае ошибки используем системную тему
      _themeMode = ThemeMode.system;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (_themeMode == themeMode) return;

    _themeMode = themeMode;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      String themeString;
      
      switch (themeMode) {
        case ThemeMode.dark:
          themeString = AppConstants.darkTheme;
          break;
        case ThemeMode.light:
          themeString = AppConstants.lightTheme;
          break;
        case ThemeMode.system:
          themeString = 'system';
          break;
      }
      
      await prefs.setString(AppConstants.themeKey, themeString);
    } catch (e) {
      // Обработка ошибки сохранения
      debugPrint('Error saving theme: $e');
    }
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }
} 
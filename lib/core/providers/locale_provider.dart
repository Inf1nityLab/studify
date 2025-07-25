import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('ru'); // По умолчанию русский
  bool _isLoading = false;

  Locale get locale => _locale;
  bool get isLoading => _isLoading;
  String get languageCode => _locale.languageCode;

  LocaleProvider() {
    _loadLocaleFromStorage();
  }

  Future<void> _loadLocaleFromStorage() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(AppConstants.languageKey);
      
      if (languageCode != null) {
        _locale = Locale(languageCode);
      } else {
        _locale = const Locale('ru'); // По умолчанию русский
      }
    } catch (e) {
      // В случае ошибки используем русский
      _locale = const Locale('ru');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;

    _locale = locale;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.languageKey, locale.languageCode);
    } catch (e) {
      debugPrint('Error saving locale: $e');
    }
  }

  void toggleLanguage() {
    if (_locale.languageCode == 'ru') {
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('ru'));
    }
  }

  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'ru':
        return 'Русский';
      case 'en':
        return 'English';
      default:
        return 'Unknown';
    }
  }

  String getCurrentLanguageName() {
    return getLanguageName(_locale.languageCode);
  }
} 
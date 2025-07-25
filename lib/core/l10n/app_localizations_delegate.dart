import 'package:flutter/material.dart';
import 'app_localizations.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return AppLocalizationsEn();
      case 'ru':
        return AppLocalizationsRu();
      default:
        return AppLocalizationsEn(); // Fallback to English
    }
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
} 
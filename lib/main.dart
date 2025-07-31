import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'core/constants/app_constants.dart';
import 'core/providers/theme_provider.dart';
import 'core/providers/locale_provider.dart';
import 'feature/navigation/presentation/providers/navigation_provider.dart';
import 'core/themes/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/l10n/app_localizations_delegate.dart';
import 'feature/navigation/presentation/screens/navigation_screen.dart';
import 'feature/school/presentation/screens/create_school_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
              child: Consumer3<ThemeProvider, LocaleProvider, NavigationProvider>(
          builder: (context, themeProvider, localeProvider, navigationProvider, child) {
          return MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: localeProvider.locale,
            themeMode: themeProvider.themeMode,
            theme: AppTheme.getLightTheme(),
            darkTheme: AppTheme.getDarkTheme(),
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ru'), Locale('en')],
            // routerConfig: router,
            home: NavigationScreen(),
          );
        },
      ),
    );
  }
}

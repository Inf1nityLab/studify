import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      primaryContainer: AppColors.darkPrimaryVariant,
      secondary: AppColors.darkSecondary,
      surface: AppColors.darkSurface,
      background: AppColors.darkBackground,
      error: AppColors.darkError,
      onPrimary: AppColors.darkOnPrimary,
      onSecondary: AppColors.darkOnSecondary,
      onSurface: AppColors.darkOnSurface,
      onBackground: AppColors.darkOnBackground,
      onError: AppColors.darkOnError,
      outline: AppColors.darkOutline,
      outlineVariant: AppColors.darkOutlineVariant,
    ),
    
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkOnSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.darkOnSurface,
        fontSize: AppSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
      ),
    ),
    
    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.darkSurface,
      elevation: AppSizes.cardElevation,
      shadowColor: AppColors.darkShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
    ),
    
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkOnPrimary,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
        textStyle: const TextStyle(
          fontSize: AppSizes.fontSizeMd,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkPrimary,
        side: const BorderSide(color: AppColors.darkPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
        textStyle: const TextStyle(
          fontSize: AppSizes.fontSizeMd,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkPrimary,
        textStyle: const TextStyle(
          fontSize: AppSizes.fontSizeMd,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkOutlineVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.darkPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.darkError, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      hintStyle: TextStyle(
        color: AppColors.darkOnSurface.withOpacity(0.6),
        fontSize: AppSizes.fontSizeMd,
      ),
    ),
    
    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppSizes.fontSizeXxxl,
        fontWeight: FontWeight.bold,
        color: AppColors.darkOnBackground,
      ),
      displayMedium: TextStyle(
        fontSize: AppSizes.fontSizeXxl,
        fontWeight: FontWeight.bold,
        color: AppColors.darkOnBackground,
      ),
      displaySmall: TextStyle(
        fontSize: AppSizes.fontSizeXl,
        fontWeight: FontWeight.bold,
        color: AppColors.darkOnBackground,
      ),
      headlineLarge: TextStyle(
        fontSize: AppSizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: AppColors.darkOnBackground,
      ),
      headlineMedium: TextStyle(
        fontSize: AppSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: AppColors.darkOnBackground,
      ),
      headlineSmall: TextStyle(
        fontSize: AppSizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: AppColors.darkOnBackground,
      ),
      bodyLarge: TextStyle(
        fontSize: AppSizes.fontSizeMd,
        color: AppColors.darkOnBackground,
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes.fontSizeSm,
        color: AppColors.darkOnBackground,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.fontSizeXs,
        color: AppColors.darkOnBackground,
      ),
    ),
    
    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.darkOnSurface,
      size: AppSizes.iconMd,
    ),
    
    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.darkOutline,
      thickness: 1,
      space: AppSizes.md,
    ),
  );
} 
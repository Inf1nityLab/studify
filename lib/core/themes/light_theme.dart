import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.navigationPrimary,
      primaryContainer: AppColors.navigationPrimaryVariant,
      secondary: AppColors.lightSecondary,
      surface: AppColors.lightSurface,
      surfaceVariant: AppColors.lightSurfaceVariant,
      background: AppColors.lightBackground,
      error: AppColors.lightError,
      onPrimary: AppColors.lightOnPrimary,
      onSecondary: AppColors.lightOnSecondary,
      onSurface: AppColors.lightOnSurface,
      onSurfaceVariant: AppColors.lightOnSurfaceVariant,
      onBackground: AppColors.lightOnBackground,
      onError: AppColors.lightOnError,
      outline: AppColors.lightOutline,
      outlineVariant: AppColors.lightOutlineVariant,
    ),
    
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightOnSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.lightOnSurface,
        fontSize: AppSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
      ),
    ),
    
    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.lightSurface,
      elevation: AppSizes.cardElevation,
      shadowColor: AppColors.lightShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
    ),
    
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightOnPrimary,
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
        foregroundColor: AppColors.lightPrimary,
        side: const BorderSide(color: AppColors.lightPrimary),
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
        foregroundColor: AppColors.lightPrimary,
        textStyle: const TextStyle(
          fontSize: AppSizes.fontSizeMd,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightOutlineVariant,
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
        borderSide: const BorderSide(color: AppColors.lightPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.lightError, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      hintStyle: TextStyle(
        color: AppColors.lightOnSurface.withOpacity(0.6),
        fontSize: AppSizes.fontSizeMd,
      ),
    ),
    
    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppSizes.fontSizeXxxl,
        fontWeight: FontWeight.bold,
        color: AppColors.lightOnBackground,
      ),
      displayMedium: TextStyle(
        fontSize: AppSizes.fontSizeXxl,
        fontWeight: FontWeight.bold,
        color: AppColors.lightOnBackground,
      ),
      displaySmall: TextStyle(
        fontSize: AppSizes.fontSizeXl,
        fontWeight: FontWeight.bold,
        color: AppColors.lightOnBackground,
      ),
      headlineLarge: TextStyle(
        fontSize: AppSizes.fontSizeXl,
        fontWeight: FontWeight.w600,
        color: AppColors.lightOnBackground,
      ),
      headlineMedium: TextStyle(
        fontSize: AppSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: AppColors.lightOnBackground,
      ),
      headlineSmall: TextStyle(
        fontSize: AppSizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: AppColors.lightOnBackground,
      ),
      bodyLarge: TextStyle(
        fontSize: AppSizes.fontSizeMd,
        color: AppColors.lightOnBackground,
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes.fontSizeSm,
        color: AppColors.lightOnBackground,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.fontSizeXs,
        color: AppColors.lightOnBackground,
      ),
    ),
    
    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.lightOnSurface,
      size: AppSizes.iconMd,
    ),
    
    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.lightOutline,
      thickness: 1,
      space: AppSizes.md,
    ),
  );
} 
import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';

class PlatformUtils {
  // Флаг для отключения desktop дизайна при компиляции
  // Закомментируйте эту строку для мобильных платформ
  static const bool enableDesktopDesign = true;
  
  // Определение платформы
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024;
  }
  
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 768 && 
           MediaQuery.of(context).size.width <= 1024;
  }
  
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 768;
  }
  
  // Основной метод для определения дизайна
  static bool shouldShowDesktopDesign(BuildContext context) {
    return enableDesktopDesign && isDesktop(context);
  }
  
  // Для планшетов пока используем мобильный дизайн
  static bool shouldShowMobileDesign(BuildContext context) {
    return isMobile(context) || isTablet(context) || !enableDesktopDesign;
  }
  
  // Responsive размеры
  static double getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
  
  static double getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }
  
  // Responsive отступы
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.all(40);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(20);
    }
  }
  
  // Responsive размеры контейнеров
  static double getMaxContentWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 1200;
    } else if (isTablet(context)) {
      return 800;
    } else {
      return double.infinity;
    }
  }

  // Responsive размеры шрифтов
  static double getResponsiveFontSize(
    BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile ?? AppSizes.fontSizeMd;
    } else if (isTablet(context)) {
      return tablet ?? mobile ?? AppSizes.fontSizeMd;
    } else {
      return mobile ?? AppSizes.fontSizeMd;
    }
  }

  // Responsive радиусы
  static double getResponsiveRadius(BuildContext context) {
    if (isDesktop(context)) {
      return AppSizes.radiusLg;
    } else if (isTablet(context)) {
      return AppSizes.radiusMd;
    } else {
      return AppSizes.radiusSm;
    }
  }

  // Responsive отступы с параметрами
  static EdgeInsets getResponsivePaddingWithParams(
    BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    final padding = isDesktop(context)
        ? (desktop ?? tablet ?? mobile ?? AppSizes.md)
        : isTablet(context)
            ? (tablet ?? mobile ?? AppSizes.md)
            : (mobile ?? AppSizes.md);
    
    return EdgeInsets.all(padding);
  }
} 
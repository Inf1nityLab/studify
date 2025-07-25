import 'package:flutter/material.dart';
import '../utils/platform_utils.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    // Если desktop дизайн отключен, показываем mobile
    if (!PlatformUtils.enableDesktopDesign) {
      return mobile;
    }

    // Определяем размер экрана
    if (PlatformUtils.isDesktop(context)) {
      // Для desktop показываем desktop виджет или tablet, или mobile
      return desktop ?? tablet ?? mobile;
    } else if (PlatformUtils.isTablet(context)) {
      // Для tablet показываем tablet виджет или mobile
      return tablet ?? mobile;
    } else {
      // Для mobile показываем mobile виджет
      return mobile;
    }
  }
} 
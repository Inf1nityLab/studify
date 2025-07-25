import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';


class AnimationWidgets {
  // Анимированный логотип для mobile
  static Widget buildAnimatedLogo({
    required IconData icon,
    required ThemeData theme,
    double size = 90,
    double iconSize = 45,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 2),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: theme.colorScheme.surface,
              border: Border.all(
                color: theme.colorScheme.outline,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: AppColors.desktopPrimary.withOpacity(0.05),
                  blurRadius: 40,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Icon(icon, size: iconSize, color: AppColors.desktopPrimary),
          ),
        );
      },
    );
  }

  // Анимированный заголовок для mobile
  static Widget buildAnimatedTitle({
    required String title,
    required ThemeData theme,
    double fontSize = 32,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1500),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.onSurface,
                letterSpacing: 2.0,
                shadows: theme.brightness == Brightness.dark ? [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ] : null,
              ),
            ),
          ),
        );
      },
    );
  }

  // Анимированный подзаголовок для mobile
  static Widget buildAnimatedSubtitle({
    required String subtitle,
    required ThemeData theme,
    double fontSize = 16,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 15 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
            ),
          ),
        );
      },
    );
  }
} 
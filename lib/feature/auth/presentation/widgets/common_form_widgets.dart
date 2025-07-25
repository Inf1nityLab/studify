import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';


class CommonFormWidgets {
  // Ряд "Запомнить меня" + "Забыли пароль?"
  static Widget rememberForgotRow({
    required bool rememberValue,
    required VoidCallback onRememberTap,
    required ThemeData theme,
    required bool isDesktop,
    required VoidCallback onForgotTap,
    required String rememberMeText,
    required String forgotPasswordText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // universalCheckbox теперь импортируется из UniversalFormWidgets
            const SizedBox(width: 10),
            Text(
              rememberMeText,
              style: TextStyle(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onForgotTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryGradientStart.withOpacity(0.2),
                  AppColors.primaryGradientMiddle.withOpacity(0.2),
                ],
              ),
              border: Border.all(
                color: AppColors.primaryGradientStart.withOpacity(0.3),
              ),
            ),
            child: Text(
              forgotPasswordText,
              style: TextStyle(
                color: AppColors.primaryGradientStart,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Нижняя ссылка для всех платформ
  static Widget bottomLinkRow({
    required String questionText,
    required String actionText,
    required VoidCallback onTap,
    required ThemeData theme,
    required bool isDesktop,
  }) {
    final container = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [AppColors.desktopPrimary, AppColors.desktopSecondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        actionText,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );

    if (isDesktop) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.background,
          border: Border.all(
            color: theme.colorScheme.outline,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questionText,
              style: TextStyle(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: container,
            ),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionText,
            style: TextStyle(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: container,
          ),
        ],
      );
    }
  }
} 
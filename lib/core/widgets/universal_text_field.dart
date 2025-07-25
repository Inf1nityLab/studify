import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class UniversalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ThemeData theme;
  final bool isDesktop;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool? isPasswordVisible;
  final VoidCallback? onPasswordToggle;
  final String? Function(String?)? validator;

  const UniversalTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.theme,
    required this.isDesktop,
    this.keyboardType,
    this.isPassword = false,
    this.isPasswordVisible,
    this.onPasswordToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {},
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          final hasError = validator != null &&
              validator!(controller.text) != null &&
              controller.text.isNotEmpty;

          Color borderColor;
          if (hasError) {
            borderColor = AppColors.errorColor;
          } else if (isFocused) {
            borderColor = isDesktop ? AppColors.desktopPrimary : AppColors.primaryGradientStart;
          } else {
            borderColor = theme.colorScheme.outline;
          }

          List<BoxShadow> shadows;
          if (isFocused) {
            shadows = [
              BoxShadow(
                color: (isDesktop ? AppColors.desktopPrimary : AppColors.primaryGradientStart).withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ];
          } else if (hasError) {
            shadows = [
              BoxShadow(
                color: AppColors.errorColor.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ];
          } else {
            shadows = [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ];
          }

          Color iconColor;
          if (hasError) {
            iconColor = AppColors.errorColor;
          } else if (isFocused) {
            iconColor = isDesktop ? AppColors.desktopPrimary : AppColors.primaryGradientStart;
          } else {
            iconColor = isDesktop 
                ? AppColors.desktopPrimary.withOpacity(0.7)
                : AppColors.primaryGradientStart.withOpacity(0.8);
          }

          final fontSize = isDesktop ? 15.0 : 16.0;
          final iconSize = isDesktop ? 20.0 : 22.0;
          final horizontalPadding = isDesktop ? 16.0 : 20.0;
          final verticalPadding = isDesktop ? 14.0 : 18.0;
          final backgroundColor = isDesktop 
              ? theme.colorScheme.background
              : theme.colorScheme.surface;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
                width: isFocused || hasError ? 2.0 : 1.5,
              ),
              boxShadow: shadows,
            ),
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: keyboardType,
              obscureText: isPassword ? !(isPasswordVisible ?? false) : false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(icon, color: iconColor, size: iconSize),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible ?? false ? Icons.visibility_off : Icons.visibility,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          size: iconSize,
                        ),
                        onPressed: onPasswordToggle,
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                errorStyle: TextStyle(
                  color: AppColors.errorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              validator: validator,
            ),
          );
        },
      ),
    );
  }
} 
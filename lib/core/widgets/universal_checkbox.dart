import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class UniversalCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onTap;
  final ThemeData theme;
  final bool isDesktop;
  final double size;

  const UniversalCheckbox({
    super.key,
    required this.value,
    required this.onTap,
    required this.theme,
    required this.isDesktop,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = isDesktop ? 4.0 : 6.0;
    final borderWidth = isDesktop ? 1.5 : 2.0;
    final iconSize = isDesktop ? 12.0 : 14.0;
    final gradient = isDesktop 
        ? const LinearGradient(
            colors: [AppColors.desktopPrimary, AppColors.desktopSecondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [AppColors.primaryGradientStart, AppColors.primaryGradientMiddle],
          );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: value ? gradient : null,
          border: Border.all(
            color: value ? Colors.transparent : theme.colorScheme.outline,
            width: borderWidth,
          ),
        ),
        child: value
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: iconSize,
              )
            : null,
      ),
    );
  }
} 
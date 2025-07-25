import 'package:flutter/material.dart';

class LogoPicker extends StatelessWidget {
  final ImageProvider? image;
  const LogoPicker({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {}, // только для анимации нажатия
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 132,
            height: 132,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.surface,
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(0.18),
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.13),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary.withOpacity(0.10),
                  theme.colorScheme.secondary.withOpacity(0.08),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: image != null
                ? ClipOval(child: Image(image: image!, fit: BoxFit.cover))
                : Icon(Icons.school, size: 60, color: theme.colorScheme.primary.withOpacity(0.8)),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.18),
                    blurRadius: 8,
                  ),
                ],
                border: Border.all(
                  color: theme.colorScheme.surface,
                  width: 2,
                ),
              ),
              child: const Icon(Icons.add_a_photo_rounded, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
    );
  }
} 
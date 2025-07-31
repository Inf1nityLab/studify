import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class DesktopLeftPanel extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData logoIcon;

  const DesktopLeftPanel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.logoIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Container(
      width: 550,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 50,
            offset: const Offset(20, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Звезды
          _buildStar(50, 80, 2, 3),
          _buildStar(120, 150, 1.5, 4),
          _buildStar(200, 60, 1, 2),
          _buildStar(80, 200, 2.5, 5),
          _buildStar(180, 120, 1.8, 3),
          _buildStar(40, 180, 1.2, 4),
          _buildStar(160, 80, 2.2, 3),
          _buildStar(100, 100, 1.6, 4),
          _buildStar(220, 160, 1.4, 2),
          _buildStar(60, 140, 2.8, 5),

          // Анимированные шарики
          _buildAnimatedBall(80, 100, 12, 6, Icons.school, AppColors.desktopPrimary),
          _buildAnimatedBall(420, 150, 10, 4, Icons.group, AppColors.desktopSecondary),
          _buildAnimatedBall(50, 400, 14, 7, Icons.verified, AppColors.desktopSuccess),
          _buildAnimatedBall(480, 450, 11, 5, Icons.quiz, AppColors.desktopAccent),
          _buildAnimatedBall(200, 80, 9, 5, Icons.star, AppColors.desktopWarning),
          _buildAnimatedBall(350, 350, 13, 6, Icons.favorite, AppColors.desktopError),
          _buildAnimatedBall(150, 450, 10, 4, Icons.bolt, AppColors.desktopAccent),
          _buildAnimatedBall(450, 80, 8, 5, Icons.diamond, AppColors.desktopPrimary),

          // Плавающие планеты
          _buildFloatingPlanet(60, 40, 50, 8, Icons.psychology, 20),
          _buildFloatingPlanet(400, 80, 35, 6, Icons.auto_awesome, 16),
          _buildFloatingPlanet(80, 300, 70, 10, Icons.trending_up, 25),
          _buildFloatingPlanet(350, 250, 45, 7, Icons.auto_awesome, 18),
          _buildFloatingPlanet(120, 180, 55, 9, Icons.trending_up, 22),

          // Основной контент
          Center(
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAnimatedLogo(logoIcon, theme),
                  const SizedBox(height: 40),
                  _buildAnimatedTitle(title, theme),
                  const SizedBox(height: 20),
                  _buildAnimatedSubtitle(subtitle, theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStar(double left, double top, double size, int duration) {
    return Positioned(
      left: left,
      top: top,
      child: TweenAnimationBuilder<double>(
        duration: Duration(seconds: duration),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.5 + (0.5 * value),
            child: Opacity(
              opacity: 0.3 + (0.7 * value),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.desktopPrimary.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.desktopPrimary.withOpacity(0.7),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedBall(double left, double top, double size, int duration, IconData icon, Color color) {
    return Positioned(
      left: left,
      top: top,
      child: TweenAnimationBuilder<double>(
        duration: Duration(seconds: duration),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          double moveX = 0;
          double moveY = 0;

          if (left < 100) {
            moveX = 20 * (value - 0.5);
            moveY = 15 * (value - 0.5);
          } else if (left > 400) {
            moveX = -20 * (value - 0.5);
            moveY = -15 * (value - 0.5);
          } else {
            moveX = 15 * (value - 0.5);
            moveY = 25 * (value - 0.5);
          }

          return Transform.translate(
            offset: Offset(moveX, moveY),
            child: Transform.rotate(
              angle: value * 2 * 3.14159,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      color.withOpacity(0.6),
                      color.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                  border: Border.all(color: color.withOpacity(0.7), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: size * 0.5),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFloatingPlanet(double top, double left, double size, int duration, IconData icon, double iconSize) {
    return Positioned(
      top: top,
      left: left,
      child: TweenAnimationBuilder<double>(
        duration: Duration(seconds: duration),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, 30 * (value - 0.5)),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.desktopPrimary.withOpacity(0.4),
                    AppColors.desktopSecondary.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
                border: Border.all(
                  color: AppColors.desktopPrimary.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Icon(icon, color: Colors.white, size: iconSize),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedLogo(IconData icon, ThemeData theme) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 2),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Container(
            width: 100,
            height: 100,
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
            child: Icon(icon, size: 45, color: AppColors.desktopPrimary),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedTitle(String title, ThemeData theme) {
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
                fontSize: 48,
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

  Widget _buildAnimatedSubtitle(String subtitle, ThemeData theme) {
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
                fontSize: 18,
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
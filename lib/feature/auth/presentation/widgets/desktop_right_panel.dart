import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/universal_action_button.dart';
import 'common_form_widgets.dart';


class DesktopRightPanel extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget formContent;
  final Widget bottomLink;
  final VoidCallback? onButtonPressed;
  final String buttonText;
  final bool isLoading;

  const DesktopRightPanel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formContent,
    required this.bottomLink,
    required this.onButtonPressed,
    required this.buttonText,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            padding: const EdgeInsets.only(top: 32, right: 32, left: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height * 0.9,
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Заголовок
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.onSurface,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 6),

                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        // Содержимое формы
                        formContent,

                        const SizedBox(height: 16),

                        // Кнопка действия
                        UniversalActionButton(
                          onPressed: onButtonPressed,
                          isLoading: isLoading,
                          text: buttonText,
                          isDesktop: true,
                        ),

                        const SizedBox(height: 16),

                        // Нижняя ссылка
                        bottomLink,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
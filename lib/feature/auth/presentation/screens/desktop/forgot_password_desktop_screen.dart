import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/desktop_left_panel.dart';
import '../../widgets/desktop_right_panel.dart';
import '../../widgets/common_form_widgets.dart';

class ForgotPasswordDesktopScreen extends StatelessWidget {
  final AuthController authController;
  const ForgotPasswordDesktopScreen({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: authController,
      builder: (context, _) {
        final isEmailSent = authController.isForgotEmailSent;
        final isLoading = authController.isLoading;
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              DesktopLeftPanel(
                title: 'Studify',
                subtitle: l10n.appSubtitle,
                logoIcon: Icons.lock_reset,
              ),
              DesktopRightPanel(
                title: isEmailSent ? l10n.emailSentTitle : l10n.forgotPassword,
                subtitle: isEmailSent
                    ? l10n.emailSentSubtitle
                    : l10n.forgotPasswordSubtitle,
                buttonText: l10n.sendInstructions,
                isLoading: isLoading,
                onButtonPressed: isEmailSent ? null : () => authController.sendForgotPasswordEmail(context),
                formContent: isEmailSent
                    ? _buildSuccessMessage(theme, l10n)
                    : Form(
                        child: Column(
                          children: [
                            UniversalTextField(
                              controller: authController.emailController,
                              hintText: l10n.email,
                              icon: Icons.email_outlined,
                              theme: theme,
                              isDesktop: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => authController.validateEmail(context, value),
                            ),
                          ],
                        ),
                      ),
                bottomLink: CommonFormWidgets.bottomLinkRow(
                  questionText: l10n.rememberPassword,
                  actionText: l10n.signInButton,
                  onTap: () => context.go('/sign-in'),
                  theme: theme,
                  isDesktop: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSuccessMessage(ThemeData theme, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: theme.colorScheme.primary,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.emailSentTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.emailSentCheck,
            style: TextStyle(
              fontSize: 14,
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/desktop_left_panel.dart';
import '../../../../../core/widgets/desktop_right_panel.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/forgot_password_form.dart';
import '../../widgets/forgot_password_success_message.dart';

class ForgotPasswordDesktopScreen extends StatelessWidget {
  final AuthController authController;

  const ForgotPasswordDesktopScreen({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final isEmailSent = authController.isForgotEmailSent;
    
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
                subtitle:
                    isEmailSent
                        ? l10n.emailSentSubtitle
                        : l10n.forgotPasswordSubtitle,
                formContent:
                    isEmailSent
                        ? ForgotPasswordSuccessMessage(isDesktop: true)
                        : ForgotPasswordForm(
                            authController: authController,
                            isDesktop: true,
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
  }
}

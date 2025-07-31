import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/animation_widgets.dart';
import '../../widgets/forgot_password_form.dart';
import '../../widgets/forgot_password_success_message.dart';


class ForgotPasswordMobileScreen extends StatelessWidget {
  final AuthController authController;
  const ForgotPasswordMobileScreen({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final isEmailSent = authController.isForgotEmailSent;
    
    return Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  Center(
                    child: AnimationWidgets.buildAnimatedLogo(
                      icon: Icons.lock_reset,
                      theme: theme,
                      size: 90,
                      iconSize: 45,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AnimationWidgets.buildAnimatedTitle(
                    title: isEmailSent ? l10n.emailSentTitle : l10n.forgotPassword,
                    theme: theme,
                    fontSize: 32,
                  ),
                  const SizedBox(height: 8),
                  AnimationWidgets.buildAnimatedSubtitle(
                    subtitle: isEmailSent ? l10n.emailSentSubtitle : l10n.forgotPasswordSubtitle,
                    theme: theme,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 48),
                  if (!isEmailSent) ...[
                    ForgotPasswordForm(
                      authController: authController,
                      isDesktop: false,
                    ),
                  ] else ...[
                    ForgotPasswordSuccessMessage(isDesktop: false),
                  ],
                  const SizedBox(height: 36),
                  CommonFormWidgets.bottomLinkRow(
                    questionText: l10n.rememberPassword,
                    actionText: l10n.signInButton,
                    onTap: () => context.go('/sign-in'),
                    theme: theme,
                    isDesktop: false,
                  ),
                ],
              ),
            ),
          ),
        );
  }
} 
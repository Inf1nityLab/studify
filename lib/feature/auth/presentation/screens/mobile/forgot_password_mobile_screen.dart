import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/animation_widgets.dart';
import '../../widgets/mobile_animation_mixin.dart';

class ForgotPasswordMobileScreen extends StatelessWidget {
  final AuthController authController;
  const ForgotPasswordMobileScreen({super.key, required this.authController});

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
                    Form(
                      child: Column(
                        children: [
                          UniversalTextField(
                            controller: authController.emailController,
                            hintText: l10n.email,
                            icon: Icons.email_outlined,
                            theme: theme,
                            isDesktop: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => authController.validateEmail(context, value),
                          ),
                          const SizedBox(height: 36),
                          UniversalActionButton(
                            onPressed: isLoading ? null : () => authController.sendForgotPasswordEmail(context),
                            isLoading: isLoading,
                            text: l10n.sendInstructions,
                            isDesktop: false,
                            height: 56,
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    _buildSuccessMessage(theme, l10n),
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
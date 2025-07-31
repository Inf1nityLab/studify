import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import 'auth_controller.dart';

class ForgotPasswordForm extends StatelessWidget {
  final AuthController authController;
  final bool isDesktop;

  const ForgotPasswordForm({
    super.key,
    required this.authController,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authController,
      builder: (context, _) {
        final theme = Theme.of(context);
        final l10n = AppLocalizations.of(context);
        final isLoading = authController.isLoading;

        return Form(
          child: Column(
            children: [
              UniversalTextField(
                controller: authController.emailController,
                hintText: l10n.email,
                icon: Icons.email_outlined,
                theme: theme,
                isDesktop: isDesktop,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => authController.validateEmail(context, value),
              ),

              SizedBox(height: isDesktop ? 24 : 36),

              UniversalActionButton(
                onPressed: isLoading ? null : () => authController.sendForgotPasswordEmail(context),
                isLoading: isLoading,
                text: l10n.sendInstructions,
                isDesktop: isDesktop,
                height: isDesktop ? 48 : 56,
              ),
            ],
          ),
        );
      },
    );
  }
} 
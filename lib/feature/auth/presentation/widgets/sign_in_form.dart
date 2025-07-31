import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import 'auth_controller.dart';
import 'common_form_widgets.dart';

class SignInForm extends StatelessWidget {
  final AuthController authController;
  final bool isDesktop;
  final GlobalKey<FormState> formKey;

  const SignInForm({
    super.key,
    required this.authController,
    required this.isDesktop,
    required this.formKey,
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
          key: formKey,
          child: Column(
            children: [
              // Email поле
              UniversalTextField(
                controller: authController.emailController,
                hintText: l10n.email,
                icon: Icons.email_outlined,
                theme: theme,
                isDesktop: isDesktop,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => authController.validateEmail(context, value),
              ),

              SizedBox(height: isDesktop ? 12 : 20),

              // Пароль поле
              UniversalTextField(
                controller: authController.passwordController,
                hintText: l10n.password,
                icon: Icons.lock_outline,
                theme: theme,
                isDesktop: isDesktop,
                isPassword: true,
                isPasswordVisible: authController.isPasswordVisible,
                onPasswordToggle: authController.togglePasswordVisibility,
                validator: (value) => authController.validatePassword(context, value),
              ),

              SizedBox(height: isDesktop ? 12 : 20),

              // Забыли пароль и Запомнить меня
              CommonFormWidgets.rememberForgotRow(
                rememberValue: authController.rememberMe,
                onRememberTap: authController.toggleRememberMe,
                theme: theme,
                isDesktop: isDesktop,
                onForgotTap: () {
                  context.go('/forgot-password');
                },
                rememberMeText: l10n.rememberMe,
                forgotPasswordText: l10n.forgotPassword,
              ),

              SizedBox(height: isDesktop ? 24 : 36),

              // Кнопка входа
              UniversalActionButton(
                onPressed: isLoading ? null : authController.signIn,
                isLoading: isLoading,
                text: l10n.signInButton,
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
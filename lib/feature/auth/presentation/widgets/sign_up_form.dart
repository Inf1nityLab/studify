import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_checkbox.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import 'auth_controller.dart';

class SignUpForm extends StatelessWidget {
  final AuthController authController;
  final bool isDesktop;
  final GlobalKey<FormState> formKey;

  const SignUpForm({
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
        final agreeToTerms = authController.agreeToTerms;

        return Form(
          key: formKey,
          child: Column(
            children: [
              // Имя поле
              UniversalTextField(
                controller: authController.nameController,
                hintText: l10n.fullName,
                icon: Icons.person_outline,
                theme: theme,
                isDesktop: isDesktop,
                keyboardType: TextInputType.name,
                validator: (value) => authController.validateName(context, value),
              ),

              SizedBox(height: isDesktop ? 12 : 20),

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

              // Подтверждение пароля поле
              UniversalTextField(
                controller: authController.confirmPasswordController,
                hintText: l10n.confirmPassword,
                icon: Icons.lock_outline,
                theme: theme,
                isDesktop: isDesktop,
                isPassword: true,
                isPasswordVisible: authController.isConfirmPasswordVisible,
                onPasswordToggle: authController.toggleConfirmPasswordVisibility,
                validator: (value) => authController.validateConfirmPassword(context, value),
              ),

              SizedBox(height: isDesktop ? 12 : 20),

              // Согласие с условиями
              Row(
                children: [
                  UniversalCheckbox(
                    value: agreeToTerms,
                    onTap: authController.toggleAgreeToTerms,
                    theme: theme,
                    isDesktop: isDesktop,
                  ),
                  SizedBox(width: isDesktop ? 8 : 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          fontSize: isDesktop ? 12 : 14,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(text: l10n.agreeToTerms),
                          TextSpan(
                            text: l10n.termsAndPolicy,
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: isDesktop ? 24 : 36),

              // Кнопка регистрации
              UniversalActionButton(
                onPressed: agreeToTerms
                    ? (isLoading ? null : authController.signUp)
                    : null,
                isLoading: isLoading,
                text: l10n.createAccountButton,
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
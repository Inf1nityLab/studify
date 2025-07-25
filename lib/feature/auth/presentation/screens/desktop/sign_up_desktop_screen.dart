import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_checkbox.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import '../../widgets/desktop_left_panel.dart';
import '../../widgets/desktop_right_panel.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/auth_controller.dart';

class SignUpDesktopScreen extends StatefulWidget {
  final AuthController authController;

  const SignUpDesktopScreen({super.key, required this.authController});

  @override
  State<SignUpDesktopScreen> createState() => _SignUpDesktopScreenState();
}

class _SignUpDesktopScreenState extends State<SignUpDesktopScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: widget.authController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              // Левая панель
              DesktopLeftPanel(
                title: 'Studify',
                subtitle: 'Будущее образования',
                logoIcon: Icons.school,
              ),

              // Правая панель
              DesktopRightPanel(
                title: l10n.createAccount,
                subtitle: l10n.signUpSubtitle,
                buttonText: l10n.createAccountButton,
                isLoading: widget.authController.isLoading,
                onButtonPressed:
                    widget.authController.agreeToTerms
                        ? widget.authController.signUp
                        : null,
                formContent: Form(
                  child: Column(
                    children: [
                      // Имя поле
                      UniversalTextField(
                        controller: widget.authController.nameController,
                        hintText: l10n.fullName,
                        icon: Icons.person_outline,
                        theme: theme,
                        isDesktop: true,
                        keyboardType: TextInputType.name,
                        validator: (value) => widget.authController.validateName(context, value),
                      ),

                      const SizedBox(height: 12),

                      // Email поле
                      UniversalTextField(
                        controller: widget.authController.emailController,
                        hintText: l10n.email,
                        icon: Icons.email_outlined,
                        theme: theme,
                        isDesktop: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => widget.authController.validateEmail(context, value),
                      ),

                      const SizedBox(height: 12),

                      // Пароль поле
                      UniversalTextField(
                        controller: widget.authController.passwordController,
                        hintText: l10n.password,
                        icon: Icons.lock_outline,
                        theme: theme,
                        isDesktop: true,
                        isPassword: true,
                        isPasswordVisible:
                            widget.authController.isPasswordVisible,
                        onPasswordToggle:
                            widget.authController.togglePasswordVisibility,
                        validator: (value) => widget.authController.validatePassword(context, value),
                      ),

                      const SizedBox(height: 12),

                      // Подтверждение пароля поле
                      UniversalTextField(
                        controller:
                            widget.authController.confirmPasswordController,
                        hintText: l10n.confirmPassword,
                        icon: Icons.lock_outline,
                        theme: theme,
                        isDesktop: true,
                        isPassword: true,
                        isPasswordVisible:
                            widget.authController.isConfirmPasswordVisible,
                        onPasswordToggle:
                            widget
                                .authController
                                .toggleConfirmPasswordVisibility,
                        validator: (value) =>
                            widget.authController.validateConfirmPassword(context, value),
                      ),

                      const SizedBox(height: 12),

                      // Согласие с условиями
                      Row(
                        children: [
                          UniversalCheckbox(
                            value: widget.authController.agreeToTerms,
                            onTap: widget.authController.toggleAgreeToTerms,
                            theme: theme,
                            isDesktop: true,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                  fontSize: 12,
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
                    ],
                  ),
                ),
                bottomLink: CommonFormWidgets.bottomLinkRow(
                  questionText: l10n.haveAccount,
                  actionText: l10n.signInButton,
                  onTap: () {
                    context.go('/sign-in');
                  },
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
}
 
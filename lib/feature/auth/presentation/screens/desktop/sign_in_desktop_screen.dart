import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/desktop_left_panel.dart';
import '../../widgets/desktop_right_panel.dart';
import '../../widgets/common_form_widgets.dart';

class SignInDesktopScreen extends StatefulWidget {
  final AuthController authController;
  
  const SignInDesktopScreen({super.key, required this.authController});

  @override
  State<SignInDesktopScreen> createState() => _SignInDesktopScreenState();
}

class _SignInDesktopScreenState extends State<SignInDesktopScreen> {
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
            title: l10n.signIn,
            subtitle: l10n.signInSubtitle,
            buttonText: l10n.signInButton,
            isLoading: widget.authController.isLoading,
            onButtonPressed: widget.authController.signIn,
            formContent: Form(
              key: _formKey,
              child: Column(
                children: [
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
                    isPasswordVisible: widget.authController.isPasswordVisible,
                    onPasswordToggle: widget.authController.togglePasswordVisibility,
                    validator:(value) => widget.authController.validatePassword(context, value),
                  ),

                  const SizedBox(height: 12),

                  // Забыли пароль и Запомнить меня
                  CommonFormWidgets.rememberForgotRow(
                    rememberValue: widget.authController.rememberMe,
                    onRememberTap: widget.authController.toggleRememberMe,
                    theme: theme,
                    isDesktop: true,
                    onForgotTap: () {
                      context.go('/forgot-password');
                    },
                    rememberMeText: l10n.rememberMe,
                    forgotPasswordText: l10n.forgotPassword,
                  ),
                ],
              ),
            ),
            bottomLink: CommonFormWidgets.bottomLinkRow(
              questionText: l10n.noAccount,
              actionText: l10n.signUpButton,
              onTap: () {
                context.go('/sign-up');
              },
              theme: theme,
              isDesktop: true,
            ),
          ),
        ],
      ));
    },
  );
  }
} 
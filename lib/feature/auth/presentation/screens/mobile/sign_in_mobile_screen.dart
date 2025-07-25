import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/animation_widgets.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/mobile_animation_mixin.dart';

class SignInMobileScreen extends StatefulWidget {
  final AuthController authController;
  
  const SignInMobileScreen({super.key, required this.authController});

  @override
  State<SignInMobileScreen> createState() => _SignInMobileScreenState();
}

class _SignInMobileScreenState extends State<SignInMobileScreen> with TickerProviderStateMixin, MobileAnimationMixin {
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
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),

                  // Логотип
                  Center(
                    child: AnimationWidgets.buildAnimatedLogo(
                      icon: Icons.school,
                      theme: theme,
                      size: 90,
                      iconSize: 45,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Заголовок
                  AnimationWidgets.buildAnimatedTitle(
                    title: l10n.welcome,
                    theme: theme,
                    fontSize: 32,
                  ),

                  const SizedBox(height: 8),

                  AnimationWidgets.buildAnimatedSubtitle(
                    subtitle: l10n.signInSubtitle,
                    theme: theme,
                    fontSize: 16,
                  ),

                  const SizedBox(height: 48),

                  // Форма входа
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email поле
                        UniversalTextField(
                          controller: widget.authController.emailController,
                          hintText: l10n.email,
                          icon: Icons.email_outlined,
                          theme: theme,
                          isDesktop: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => widget.authController.validateEmail(context, value),
                        ),

                        const SizedBox(height: 20),

                        // Пароль поле
                        UniversalTextField(
                          controller: widget.authController.passwordController,
                          hintText: l10n.password,
                          icon: Icons.lock_outline,
                          theme: theme,
                          isDesktop: false,
                          isPassword: true,
                          isPasswordVisible: widget.authController.isPasswordVisible,
                          onPasswordToggle: widget.authController.togglePasswordVisibility,
                          validator: (value) => widget.authController.validatePassword(context, value),
                        ),

                        const SizedBox(height: 20),

                        // Забыли пароль и Запомнить меня
                        CommonFormWidgets.rememberForgotRow(
                          rememberValue: widget.authController.rememberMe,
                          onRememberTap: widget.authController.toggleRememberMe,
                          theme: theme,
                          isDesktop: false,
                          onForgotTap: () {
                            context.go('/forgot-password');
                          },
                          rememberMeText: l10n.rememberMe,
                          forgotPasswordText: l10n.forgotPassword,
                        ),

                        const SizedBox(height: 36),

                        // Кнопка входа
                        UniversalActionButton(
                          onPressed: widget.authController.isLoading ? null : widget.authController.signIn,
                          isLoading: widget.authController.isLoading,
                          text: l10n.signInButton,
                          isDesktop: false,
                          height: 56,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 36),

                  // Ссылка на регистрацию
                  CommonFormWidgets.bottomLinkRow(
                    questionText: l10n.noAccount,
                    actionText: l10n.signUpButton,
                    onTap: () {
                      context.go('/sign-up');
                    },
                    theme: theme,
                    isDesktop: false,
                  ),
                ],
              ),
            ),
          ),
        )));
      },
    );
  }
} 
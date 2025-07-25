import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_checkbox.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/animation_widgets.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/mobile_animation_mixin.dart';

class SignUpMobileScreen extends StatefulWidget {
  final AuthController authController;

  const SignUpMobileScreen({super.key, required this.authController});

  @override
  State<SignUpMobileScreen> createState() => _SignUpMobileScreenState();
}

class _SignUpMobileScreenState extends State<SignUpMobileScreen>
    with TickerProviderStateMixin, MobileAnimationMixin {
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
                          icon: Icons.person_add_outlined,
                          theme: theme,
                          size: 90,
                          iconSize: 45,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Заголовок
                      AnimationWidgets.buildAnimatedTitle(
                        title: l10n.createAccount,
                        theme: theme,
                        fontSize: 32,
                      ),

                      const SizedBox(height: 8),

                      AnimationWidgets.buildAnimatedSubtitle(
                        subtitle: l10n.signUpSubtitle,
                        theme: theme,
                        fontSize: 16,
                      ),

                      const SizedBox(height: 48),

                      // Форма регистрации
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Имя поле
                            UniversalTextField(
                              controller: widget.authController.nameController,
                              hintText: l10n.fullName,
                              icon: Icons.person_outline,
                              theme: theme,
                              isDesktop: false,
                              keyboardType: TextInputType.name,
                              validator:
                                  (value) => widget.authController.validateName(
                                    context,
                                    value,
                                  ),
                            ),

                            const SizedBox(height: 20),

                            // Email поле
                            UniversalTextField(
                              controller: widget.authController.emailController,
                              hintText: l10n.email,
                              icon: Icons.email_outlined,
                              theme: theme,
                              isDesktop: false,
                              keyboardType: TextInputType.emailAddress,
                              validator:
                                  (value) => widget.authController
                                      .validateEmail(context, value),
                            ),

                            const SizedBox(height: 20),

                            // Пароль поле
                            UniversalTextField(
                              controller:
                                  widget.authController.passwordController,
                              hintText: l10n.password,
                              icon: Icons.lock_outline,
                              theme: theme,
                              isDesktop: false,
                              isPassword: true,
                              isPasswordVisible:
                                  widget.authController.isPasswordVisible,
                              onPasswordToggle:
                                  widget
                                      .authController
                                      .togglePasswordVisibility,
                              validator:
                                  (value) => widget.authController
                                      .validatePassword(context, value),
                            ),

                            const SizedBox(height: 20),

                            // Подтверждение пароля поле
                            UniversalTextField(
                              controller:
                                  widget
                                      .authController
                                      .confirmPasswordController,
                              hintText: l10n.confirmPassword,
                              icon: Icons.lock_outline,
                              theme: theme,
                              isDesktop: false,
                              isPassword: true,
                              isPasswordVisible:
                                  widget
                                      .authController
                                      .isConfirmPasswordVisible,
                              onPasswordToggle:
                                  widget
                                      .authController
                                      .toggleConfirmPasswordVisibility,
                              validator:
                                  (value) => widget.authController
                                      .validateConfirmPassword(context, value),
                            ),

                            const SizedBox(height: 20),

                            // Согласие с условиями
                            Row(
                              children: [
                                UniversalCheckbox(
                                  value: widget.authController.agreeToTerms,
                                  onTap:
                                      widget.authController.toggleAgreeToTerms,
                                  theme: theme,
                                  isDesktop: false,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface
                                            .withOpacity(0.6),
                                        fontSize: 14,
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

                            const SizedBox(height: 36),

                            // Кнопка регистрации
                            UniversalActionButton(
                              onPressed:
                                  widget.authController.agreeToTerms
                                      ? (widget.authController.isLoading
                                          ? null
                                          : widget.authController.signUp)
                                      : null,
                              isLoading: widget.authController.isLoading,
                              text: l10n.createAccountButton,
                              isDesktop: false,
                              height: 56,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 36),

                      // Ссылка на вход
                      CommonFormWidgets.bottomLinkRow(
                        questionText: l10n.haveAccount,
                        actionText: l10n.signInButton,
                        onTap: () {
                          context.go('/sign-in');
                        },
                        theme: theme,
                        isDesktop: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

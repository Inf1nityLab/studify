import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/animation_widgets.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/sign_in_form.dart';
import '../../../../../core/widgets/mobile_animation_mixin.dart';

class SignInMobileScreen extends StatefulWidget {
  final AuthController authController;

  const SignInMobileScreen({super.key, required this.authController});

  @override
  State<SignInMobileScreen> createState() => _SignInMobileScreenState();
}

class _SignInMobileScreenState extends State<SignInMobileScreen>
    with TickerProviderStateMixin, MobileAnimationMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

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
                  SignInForm(
                    authController: widget.authController,
                    isDesktop: false,
                    formKey: _formKey,
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
        ),
      ),
    );
  }
}

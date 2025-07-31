import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/desktop_left_panel.dart';
import '../../../../../core/widgets/desktop_right_panel.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/sign_in_form.dart';

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
            formContent: SignInForm(
              authController: widget.authController,
              isDesktop: true,
              formKey: _formKey,
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
  }
} 
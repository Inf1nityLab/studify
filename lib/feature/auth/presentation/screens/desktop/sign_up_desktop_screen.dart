import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/desktop_left_panel.dart';
import '../../../../../core/widgets/desktop_right_panel.dart';
import '../../widgets/common_form_widgets.dart';
import '../../widgets/auth_controller.dart';
import '../../widgets/sign_up_form.dart';

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
                formContent: SignUpForm(
                  authController: widget.authController,
                  isDesktop: true,
                  formKey: _formKey,
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
  }
}
 
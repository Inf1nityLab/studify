import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../widgets/auth_controller.dart';
import 'mobile/forgot_password_mobile_screen.dart';
import 'desktop/forgot_password_desktop_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ForgotPasswordMobileScreen(authController: _authController),
      desktop: ForgotPasswordDesktopScreen(authController: _authController),
    );
  }
} 
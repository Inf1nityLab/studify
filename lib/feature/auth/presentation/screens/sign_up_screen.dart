import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../widgets/auth_controller.dart';
import 'mobile/sign_up_mobile_screen.dart';
import 'desktop/sign_up_desktop_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SignUpMobileScreen(authController: _authController),
      desktop: SignUpDesktopScreen(authController: _authController),
    );
  }
}
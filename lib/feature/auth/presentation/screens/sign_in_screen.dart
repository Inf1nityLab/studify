import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../widgets/auth_controller.dart';
import 'mobile/sign_in_mobile_screen.dart';
import 'desktop/sign_in_desktop_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SignInMobileScreen(authController: _authController),
      desktop: SignInDesktopScreen(authController: _authController),
    );
  }
}
 
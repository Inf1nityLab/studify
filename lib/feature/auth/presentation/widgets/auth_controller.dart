import 'package:flutter/material.dart';
import '../../../../core/l10n/app_localizations.dart';

class AuthController extends ChangeNotifier {
  // Состояния для всех экранов
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _rememberMe = false;
  bool _agreeToTerms = false;
  bool _isForgotEmailSent = false;

  // Контроллеры
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // Геттеры
  bool get isLoading => _isLoading;

  bool get isPasswordVisible => _isPasswordVisible;

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  bool get rememberMe => _rememberMe;

  bool get agreeToTerms => _agreeToTerms;

  bool get isForgotEmailSent => _isForgotEmailSent;

  // Методы для изменения состояний
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }

  void toggleAgreeToTerms() {
    _agreeToTerms = !_agreeToTerms;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Методы для аутентификации
  Future<void> signIn() async {
    setLoading(true);

    // TODO: Implement sign in logic
    await Future.delayed(const Duration(seconds: 2));

    setLoading(false);
    // TODO: Navigate to home
  }

  Future<void> signUp() async {
    setLoading(true);

    // TODO: Implement sign up logic
    await Future.delayed(const Duration(seconds: 2));

    setLoading(false);
    // TODO: Navigate to home or email verification
  }

  // Локализованные методы валидации
  String? validateEmail(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n.emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
      return l10n.emailInvalid;
    }
    return null;
  }

  String? validatePassword(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n.passwordRequired;
    }
    if (value.length < 6) {
      return l10n.passwordMinLength;
    }
    return null;
  }

  String? validateConfirmPassword(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n.passwordRequired;
    }
    if (value != passwordController.text) {
      return l10n.passwordsNotMatch;
    }
    return null;
  }

  String? validateName(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n.nameRequired;
    }
    if (value.length < 2) {
      return l10n.nameMinLength;
    }
    return null;
  }

  // Проверка формы входа
  bool validateSignInForm(BuildContext context) {
    return validateEmail(context, emailController.text) == null &&
        validatePassword(context, passwordController.text) == null;
  }

  // Проверка формы регистрации
  bool validateSignUpForm(BuildContext context) {
    return validateName(context, nameController.text) == null &&
        validateEmail(context, emailController.text) == null &&
        validatePassword(context, passwordController.text) == null &&
        validateConfirmPassword(context, confirmPasswordController.text) == null &&
        agreeToTerms;
  }

  Future<void> sendForgotPasswordEmail(BuildContext context) async {
    if (validateEmail(context, emailController.text) != null) return;
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
    _isForgotEmailSent = true;
    notifyListeners();
  }

  void resetForgotPasswordState() {
    _isForgotEmailSent = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}

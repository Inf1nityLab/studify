import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../feature/auth/presentation/screens/sign_in_screen.dart';
import '../../feature/auth/presentation/screens/sign_up_screen.dart';
import '../../feature/auth/presentation/screens/forgot_password_screen.dart';
import '../../feature/settings/presentation/screens/settings_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/settings',
  routes: [
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      name: 'sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      name: 'sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Страница не найдена',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/sign-in'),
            child: const Text('Вернуться на главную'),
          ),
        ],
      ),
    ),
  ),
); 
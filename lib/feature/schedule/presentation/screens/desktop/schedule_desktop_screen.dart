import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';

class ScheduleDesktopScreen extends StatelessWidget {
  const ScheduleDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule,
            size: 80,
            color: theme.colorScheme.primary,
          ),
          SizedBox(height: 24),
          Text(
            'Desktop: ${l10n.schedule}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Десктопная версия расписания',
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
} 
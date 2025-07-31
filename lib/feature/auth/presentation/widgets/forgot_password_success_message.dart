import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';

class ForgotPasswordSuccessMessage extends StatelessWidget {
  final bool isDesktop;

  const ForgotPasswordSuccessMessage({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? 24 : 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDesktop ? 16 : 16),
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: isDesktop ? 16 : 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: isDesktop ? 60 : 60,
            height: isDesktop ? 60 : 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isDesktop ? 30 : 30),
              color: theme.colorScheme.primary,
            ),
            child: Icon(
              Icons.check, 
              color: Colors.white, 
              size: isDesktop ? 30 : 30,
            ),
          ),
          SizedBox(height: isDesktop ? 16 : 16),
          Text(
            l10n.emailSentTitle,
            style: TextStyle(
              fontSize: isDesktop ? 18 : 18,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: isDesktop ? 8 : 8),
          Text(
            l10n.emailSentCheck,
            style: TextStyle(
              fontSize: isDesktop ? 14 : 14,
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
} 
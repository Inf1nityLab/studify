import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';

class GroupCard extends StatelessWidget {
  final Map<String, dynamic> groupData;
  final bool isDesktop;

  const GroupCard({
    super.key,
    required this.groupData,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? 24 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDesktop ? 16 : 12),
        color: theme.colorScheme.surface,
        border: Border.all(
          color: theme.colorScheme.outline,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: isDesktop ? 16 : 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок карточки
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.primary.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.group,
                  color: theme.colorScheme.primary,
                  size: isDesktop ? 24 : 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Группа',
                      style: TextStyle(
                        fontSize: isDesktop ? 12 : 11,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      groupData['name'] ?? '',
                      style: TextStyle(
                        fontSize: isDesktop ? 18 : 16,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Информация о группе
          _buildInfoRow(
            icon: Icons.book_outlined,
            label: 'Предмет',
            value: groupData['subject'] ?? '',
            theme: theme,
            isDesktop: isDesktop,
          ),

          SizedBox(height: isDesktop ? 12 : 10),

          _buildInfoRow(
            icon: Icons.trending_up_outlined,
            label: 'Направление',
            value: groupData['direction'] ?? '',
            theme: theme,
            isDesktop: isDesktop,
          ),

          SizedBox(height: isDesktop ? 12 : 10),

          _buildInfoRow(
            icon: Icons.qr_code_outlined,
            label: 'Код группы',
            value: groupData['code'] ?? '',
            theme: theme,
            isDesktop: isDesktop,
          ),

          SizedBox(height: isDesktop ? 12 : 10),

          _buildInfoRow(
            icon: Icons.person_outline,
            label: 'Учитель',
            value: groupData['teacher'] ?? '',
            theme: theme,
            isDesktop: isDesktop,
          ),

          const SizedBox(height: 20),

          // Кнопка присоединиться
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Логика присоединения к группе
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Вы присоединились к группе "${groupData['name']}"'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                'Присоединиться к группе',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                padding: EdgeInsets.symmetric(vertical: isDesktop ? 16 : 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required ThemeData theme,
    required bool isDesktop,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: isDesktop ? 18 : 16,
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: isDesktop ? 12 : 11,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: isDesktop ? 14 : 13,
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/navigation_provider.dart';
import '../../../../core/l10n/app_localizations.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('Выбор типа пользователя'),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Заголовок
            Text(
              'Выберите тип пользователя',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 8),
            
            Text(
              'Для тестирования навигации',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 32),
            
            // Карточки типов пользователей
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                                         _buildUserTypeCard(
                       context,
                       UserType.student,
                       'Ученик',
                       'Расписание, статистика, видео, studio, профиль (без FAB)',
                       Icons.person,
                       theme.colorScheme.primary,
                     ),
                    
                    const SizedBox(height: 16),
                    
                                         _buildUserTypeCard(
                       context,
                       UserType.teacher,
                       'Учитель',
                       'Расписание, статистика, видео, studio, профиль (с FAB)',
                       Icons.school,
                       theme.colorScheme.secondary,
                     ),
                    
                    const SizedBox(height: 16),
                    
                                         _buildUserTypeCard(
                       context,
                       UserType.individualTeacher,
                       'Индивидуальный учитель',
                       'Расписание, статистика, видео, studio, профиль (с FAB)',
                       Icons.person_outline,
                       theme.colorScheme.tertiary,
                     ),
                    
                    const SizedBox(height: 16),
                    
                                         _buildUserTypeCard(
                       context,
                       UserType.manager,
                       'Менеджер',
                       'Расписание, статистика, видео, studio, профиль (с FAB)',
                       Icons.manage_accounts,
                       Colors.orange,
                     ),
                    
                    const SizedBox(height: 16),
                    
                                         _buildUserTypeCard(
                       context,
                       UserType.ceo,
                       'CEO',
                       'Расписание, статистика, видео, studio, профиль (с FAB)',
                       Icons.admin_panel_settings,
                       Colors.purple,
                     ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTypeCard(
    BuildContext context,
    UserType userType,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Устанавливаем тип пользователя и переходим к навигации
          context.read<NavigationProvider>().setUserType(userType);
          context.go('/navigation');
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              // Иконка
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Текст
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Стрелка
              Icon(
                Icons.arrow_forward_ios,
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
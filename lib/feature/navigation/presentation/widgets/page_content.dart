import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../../../../feature/schedule/presentation/screens/schedule_screen.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        // Получаем текущий индекс
        final currentIndex = navigationProvider.currentIndex;
        
        // Отображаем соответствующую страницу в зависимости от индекса
        switch (currentIndex) {
          case 0: // Расписание
            return ScheduleScreen();
          case 1: // Статистика
            return _buildPlaceholderPage(context, 'Статистика', Icons.bar_chart);
          case 2: // Создание группы (FAB) или Видео
            if (navigationProvider.fabIndex == 2) {
              return _buildPlaceholderPage(context, 'Создание группы', Icons.group_add);
            } else {
              return _buildPlaceholderPage(context, 'Видео', Icons.video_library);
            }
          case 3: // Видео или Профиль/Школа
            if (navigationProvider.fabIndex == 2) {
              return _buildPlaceholderPage(context, 'Видео', Icons.video_library);
            } else {
              return _buildPlaceholderPage(context, 'Профиль', Icons.person_outline);
            }
          case 4: // Профиль/Школа
            return _buildPlaceholderPage(context, 'Профиль', Icons.person_outline);
          default:
            return _buildPlaceholderPage(context, 'Неизвестная страница', Icons.help_outline);
        }
      },
    );
  }

  Widget _buildPlaceholderPage(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: theme.colorScheme.primary,
          ),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Страница в разработке',
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
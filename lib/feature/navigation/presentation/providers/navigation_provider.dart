import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/l10n/app_localizations.dart';

enum UserType {
  student,    // Ученик
  teacher,    // Учитель
  individualTeacher, // Индивидуальный учитель
  manager,    // Менеджер
  ceo,        // CEO
}

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  UserType _userType = UserType.student;
  bool _isSidebarExpanded = true; // Состояние sidebar

  int get currentIndex => _currentIndex;
  UserType get userType => _userType;
  bool get isSidebarExpanded => _isSidebarExpanded;

  NavigationProvider() {
    _loadSidebarState();
  }

  // Загружаем состояние sidebar из SharedPreferences
  Future<void> _loadSidebarState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isSidebarExpanded = prefs.getBool('sidebar_expanded') ?? true;
      notifyListeners();
    } catch (e) {
      // В случае ошибки используем значение по умолчанию
      _isSidebarExpanded = true;
    }
  }

  // Сохраняем состояние sidebar в SharedPreferences
  Future<void> _saveSidebarState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('sidebar_expanded', _isSidebarExpanded);
    } catch (e) {
      // Обработка ошибки сохранения
      debugPrint('Error saving sidebar state: $e');
    }
  }

  // Переключаем состояние sidebar
  void toggleSidebar() {
    _isSidebarExpanded = !_isSidebarExpanded;
    _saveSidebarState();
    notifyListeners();
  }

  // Устанавливаем состояние sidebar
  void setSidebarExpanded(bool expanded) {
    _isSidebarExpanded = expanded;
    _saveSidebarState();
    notifyListeners();
  }

  void setUserType(UserType userType) {
    _userType = userType;
    _currentIndex = 0; // Сбрасываем на первый экран при смене типа пользователя
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Геттер для текущего выбранного индекса
  int get selectedIndex => _currentIndex;

  // Получаем список вкладок для текущего типа пользователя
  List<NavigationItem> getNavigationItems(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    switch (_userType) {
      case UserType.student:
        return [
          NavigationItem(icon: Icons.schedule, label: l10n.schedule),
          NavigationItem(icon: Icons.bar_chart, label: l10n.statistics),
          NavigationItem(icon: Icons.video_library, label: l10n.video),
          NavigationItem(icon: Icons.person_outline, label: l10n.profile),
        ];
      
      case UserType.teacher:
        return [
          NavigationItem(icon: Icons.schedule, label: l10n.schedule),
          NavigationItem(icon: Icons.bar_chart, label: l10n.statistics),
          NavigationItem(icon: Icons.group_add, label: l10n.createGroup), // FAB
          NavigationItem(icon: Icons.video_library, label: l10n.video),
          NavigationItem(icon: Icons.person_outline, label: l10n.profile),
        ];
      
      case UserType.individualTeacher:
        return [
          NavigationItem(icon: Icons.schedule, label: l10n.schedule),
          NavigationItem(icon: Icons.bar_chart, label: l10n.statistics),
          NavigationItem(icon: Icons.group_add, label: l10n.createGroup), // FAB
          NavigationItem(icon: Icons.video_library, label: l10n.video),
          NavigationItem(icon: Icons.school, label: l10n.school), // Профиль школы
        ];
      
      case UserType.manager:
        return [
          NavigationItem(icon: Icons.schedule, label: l10n.schedule),
          NavigationItem(icon: Icons.bar_chart, label: l10n.statistics),
          NavigationItem(icon: Icons.group_add, label: l10n.createGroup), // FAB
          NavigationItem(icon: Icons.video_library, label: l10n.video),
          NavigationItem(icon: Icons.school, label: l10n.school), // Профиль школы
        ];
      
      case UserType.ceo:
        return [
          NavigationItem(icon: Icons.schedule, label: l10n.schedule),
          NavigationItem(icon: Icons.bar_chart, label: l10n.statistics),
          NavigationItem(icon: Icons.group_add, label: l10n.createGroup), // FAB
          NavigationItem(icon: Icons.video_library, label: l10n.video),
          NavigationItem(icon: Icons.school, label: l10n.school), // Профиль школы
        ];
    }
  }

  // Получаем индекс FAB для текущего типа пользователя
  int? get fabIndex {
    switch (_userType) {
      case UserType.student:
        return null; // У студента нет FAB
      case UserType.teacher:
      case UserType.individualTeacher:
      case UserType.manager:
      case UserType.ceo:
        return 2; // FAB на 3-м месте (индекс 2)
    }
  }

  // Проверяем, нужен ли FloatingActionButton
  bool get hasFloatingActionButton {
    return fabIndex != null;
  }

  // Получаем элементы для bottom navigation (исключая FAB)
  List<NavigationItem> getBottomNavigationItems(BuildContext context) {
    final items = getNavigationItems(context);
    final fabIdx = fabIndex;
    
    if (fabIdx == null) {
      return items; // У студента все элементы в bottom navigation
    }
    
    // Исключаем элемент FAB из bottom navigation
    return [
      ...items.take(fabIdx),
      ...items.skip(fabIdx + 1),
    ];
  }

  // Преобразуем индекс bottom navigation в индекс NavigationProvider
  int getNavigationIndexFromBottomNav(int bottomNavIndex) {
    final fabIdx = fabIndex;
    
    if (fabIdx == null) {
      return bottomNavIndex; // У студента индексы совпадают
    }
    
    // Если индекс больше или равен позиции FAB, добавляем 1
    return bottomNavIndex >= fabIdx ? bottomNavIndex + 1 : bottomNavIndex;
  }

  // Преобразуем индекс NavigationProvider в индекс bottom navigation
  int getBottomNavIndexFromNavigation(int navigationIndex) {
    final fabIdx = fabIndex;
    
    if (fabIdx == null) {
      return navigationIndex; // У студента индексы совпадают
    }
    
    // Если индекс больше позиции FAB, вычитаем 1
    return navigationIndex > fabIdx ? navigationIndex - 1 : navigationIndex;
  }

  // Получаем активный индекс для bottom navigation
  int get bottomNavigationActiveIndex {
    final fabIdx = fabIndex;
    
    if (fabIdx == null) {
      return _currentIndex; // У студента индексы совпадают
    }
    
    // Если выбран FAB, не показываем активный элемент
    if (_currentIndex == fabIdx) {
      return -1;
    }
    
    // Преобразуем индекс
    return getBottomNavIndexFromNavigation(_currentIndex);
  }
}

class NavigationItem {
  final IconData icon;
  final String label;

  NavigationItem({
    required this.icon,
    required this.label,
  });
} 
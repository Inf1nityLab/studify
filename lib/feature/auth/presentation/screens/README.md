# Архитектура экранов аутентификации

## 📁 Структура файлов

```
lib/feature/auth/presentation/screens/
├── sign_in_screen.dart          # Основной экран (роутер)
├── mobile/
│   └── sign_in_mobile_screen.dart    # Мобильная версия
└── desktop/
    └── sign_in_desktop_screen.dart   # Desktop версия
```

## 🎯 Принципы архитектуры

### ✅ DRY (Don't Repeat Yourself)
- **Глобальные утилиты**: `PlatformUtils` для определения платформы
- **Переиспользуемые виджеты**: `MobileFormWidgets`, `DesktopFormWidgets`
- **Централизованные стили**: `ColorUtils`, `GradientUtils`, `ShadowUtils`

### 📱 Разделение дизайнов
- **Mobile**: Вертикальный layout с анимациями
- **Desktop**: Горизонтальный layout с левой и правой панелями
- **Tablet**: Использует мобильный дизайн

### 🔧 Возможность отключения desktop дизайна

В файле `lib/core/utils/platform_utils.dart`:

```dart
// Закомментируйте эту строку для мобильных платформ
static const bool enableDesktopDesign = true; // ← Закомментировать для Play Store/App Store
```

## 🚀 Использование

### Основной экран
```dart
class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.shouldShowDesktopDesign(context)) {
      return const SignInDesktopScreen();
    } else {
      return const SignInMobileScreen();
    }
  }
}
```

### Создание нового экрана
1. Создайте основной файл экрана
2. Создайте папки `mobile/` и `desktop/`
3. Создайте соответствующие версии экрана
4. Используйте `PlatformUtils.shouldShowDesktopDesign(context)`

## 📋 Преимущества

- ✅ **Синхронность**: Обе версии всегда в актуальном состоянии
- ✅ **Масштабируемость**: Легко добавлять новые экраны
- ✅ **Гибкость**: Можно отключить desktop дизайн для мобильных платформ
- ✅ **Чистота кода**: Разделение ответственности
- ✅ **Переиспользование**: Общие виджеты и утилиты

## 🔄 Синхронизация

При изменении логики:
1. Обновите основной экран
2. Синхронизируйте изменения в mobile и desktop версиях
3. Убедитесь, что все функции работают одинаково

## 📦 Компиляция

### Для веб/desktop:
```bash
flutter run -d chrome
# или
flutter run -d windows
```

### Для мобильных платформ:
1. Закомментируйте `enableDesktopDesign = true;`
2. Скомпилируйте для Android/iOS
```bash
flutter build apk
flutter build ios
``` 
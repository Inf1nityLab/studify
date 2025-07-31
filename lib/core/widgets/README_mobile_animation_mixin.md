# MobileAnimationMixin

Глобальный миксин для добавления стандартных анимаций в мобильные экраны.

## Использование

### 1. Импорт
```dart
import 'package:your_app/core/widgets/mobile_animation_mixin.dart';
```

### 2. Применение к StatefulWidget
```dart
class YourMobileScreen extends StatefulWidget {
  @override
  State<YourMobileScreen> createState() => _YourMobileScreenState();
}

class _YourMobileScreenState extends State<YourMobileScreen> 
    with TickerProviderStateMixin, MobileAnimationMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: YourContent(),
          ),
        ),
      ),
    );
  }
}
```

## Доступные анимации

### fadeAnimation
- **Тип**: `Animation<double>`
- **Длительность**: 800ms
- **Кривая**: `Curves.easeInOut`
- **Диапазон**: 0.0 → 1.0

### slideAnimation
- **Тип**: `Animation<Offset>`
- **Длительность**: 1000ms
- **Кривая**: `Curves.easeOutCubic`
- **Диапазон**: `Offset(0, 0.2)` → `Offset.zero`

## Автоматическое управление

Миксин автоматически:
- Инициализирует анимации в `initState()`
- Запускает анимации при создании виджета
- Освобождает ресурсы в `dispose()`

## Примеры использования

### Базовый экран
```dart
class MyMobileScreen extends StatefulWidget {
  @override
  State<MyMobileScreen> createState() => _MyMobileScreenState();
}

class _MyMobileScreenState extends State<MyMobileScreen> 
    with TickerProviderStateMixin, MobileAnimationMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Ваш контент
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### С дополнительными анимациями
```dart
class _MyMobileScreenState extends State<MyMobileScreen> 
    with TickerProviderStateMixin, MobileAnimationMixin {
  
  // Дополнительные анимации
  late AnimationController _customController;
  late Animation<double> _customAnimation;
  
  @override
  void initState() {
    super.initState(); // MobileAnimationMixin автоматически инициализируется
    
    // Ваши дополнительные анимации
    _customController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _customAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_customController);
  }
  
  @override
  void dispose() {
    _customController.dispose(); // Ваши анимации
    super.dispose(); // MobileAnimationMixin автоматически освобождает ресурсы
  }
}
```

## Преимущества

1. **Единообразие**: Все мобильные экраны имеют одинаковые анимации
2. **DRY принцип**: Не нужно дублировать код анимаций
3. **Простота**: Минимальный код для добавления анимаций
4. **Производительность**: Оптимизированные анимации
5. **Поддержка**: Легко изменить анимации глобально 
# ST - Система регистрации на основе ролей

Современное Flutter приложение с системой аутентификации на основе ролей, использующее Supabase в качестве backend.

## 🚀 Возможности

- **Регистрация с выбором роли** (5 ролей: CEO, Менеджер, Учитель, Студент, Индивидуальный учитель)
- **Автоматическая авторизация** через Supabase
- **Современный UI** с Material Design 3
- **Чистая архитектура** с Riverpod
- **Кроссплатформенность** (мобильные устройства и веб)

## 🏗️ Архитектура

```
lib/
├── core/
│   ├── constants/          # Константы приложения
│   ├── config/            # Конфигурация Supabase
│   ├── models/            # Модели данных
│   ├── providers/         # Riverpod провайдеры
│   ├── routing/           # Навигация (GoRouter)
│   └── widgets/           # Переиспользуемые виджеты
├── features/
│   ├── auth/              # Модуль аутентификации
│   │   └── presentation/
│   │       └── pages/     # Страницы авторизации
│   └── dashboard/         # Модуль дашборда
│       └── presentation/
│           └── pages/     # Страницы дашборда
└── main.dart              # Точка входа
```

## 🛠️ Технологии

- **Flutter** - UI фреймворк
- **Supabase** - Backend (аутентификация + база данных)
- **Riverpod** - Управление состоянием
- **GoRouter** - Навигация
- **Flutter Hooks** - Упрощение логики
- **Form Builder** - Валидация форм

## 📋 Роли пользователей

1. **CEO** - Руководитель организации
2. **Менеджер** - Управление процессами и людьми
3. **Учитель** - Преподаватель в организации
4. **Студент** - Учащийся или студент
5. **Индивидуальный учитель** - Регистрируется как CEO

## 🚀 Быстрый старт

### 1. Клонирование и установка зависимостей

```bash
git clone <repository-url>
cd st
flutter pub get
```

### 2. Настройка Supabase

1. Создайте проект на [supabase.com](https://supabase.com)
2. Получите URL и Anon Key из настроек проекта
3. Обновите `lib/core/config/supabase_config.dart`:

```dart
static const String supabaseUrl = 'YOUR_SUPABASE_URL';
static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### 3. Создание базы данных

Выполните SQL скрипт в Supabase SQL Editor:

```sql
-- Создание схемы
CREATE SCHEMA IF NOT EXISTS users;

-- Создание таблицы пользователей
CREATE TABLE users.users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone_number text,
  email text unique not null,
  role text not null check (role in ('ceo', 'manager', 'teacher', 'student')),
  is_active boolean default true,
  created_at timestamp with time zone default timezone('utc', now()),
  updated_at timestamp with time zone default timezone('utc', now())
);

-- Включение RLS
ALTER TABLE users.users ENABLE ROW LEVEL SECURITY;

-- Политики безопасности
CREATE POLICY "Users can view their own profile" ON users.users
FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can insert their own profile" ON users.users
FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update their own profile" ON users.users
FOR UPDATE USING (auth.uid() = id);

-- Функция для автоматического обновления updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = timezone('utc', now());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Триггер для автоматического обновления updated_at
CREATE TRIGGER update_users_updated_at 
BEFORE UPDATE ON users.users 
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
```

### 4. Генерация кода

```bash
flutter packages pub run build_runner build
```

### 5. Запуск приложения

```bash
flutter run
```

## 📱 Использование

### Регистрация

1. Откройте приложение
2. Нажмите "Зарегистрироваться"
3. Выберите роль из списка
4. Заполните форму регистрации
5. Нажмите "Зарегистрироваться"

### Вход

1. Введите email и пароль
2. Нажмите "Войти"
3. После успешной авторизации вы попадете на дашборд

### Дашборд

- Просмотр информации профиля
- Выход из аккаунта
- Отображение роли пользователя

## 🔧 Настройка для разработки

### Структура проекта

Проект следует принципам чистой архитектуры:

- **Presentation Layer** - UI и виджеты
- **Domain Layer** - Бизнес-логика (провайдеры)
- **Data Layer** - Модели данных и конфигурация

### Добавление новых ролей

1. Обновите `AppConstants.roleDisplayNames`
2. Добавьте цвет в `AppColors.roleColors`
3. Обновите SQL схему базы данных
4. Добавьте иконку в `_getRoleIcon()` метод

### Кастомизация UI

- Цвета: `lib/core/constants/app_colors.dart`
- Стили текста: `lib/core/constants/app_text_styles.dart`
- Виджеты: `lib/core/widgets/`

## 🐛 Отладка

### Логи Supabase

Включите логи в Supabase Dashboard:
1. Settings → Logs
2. Выберите нужные типы логов

### Flutter DevTools

```bash
flutter run --debug
```

### Hot Reload

```bash
# В терминале с запущенным приложением
r
```

## 📦 Сборка

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## 🤝 Вклад в проект

1. Fork репозитория
2. Создайте feature branch
3. Внесите изменения
4. Создайте Pull Request

## 📄 Лицензия

MIT License

## 🆘 Поддержка

При возникновении проблем:

1. Проверьте настройки Supabase
2. Убедитесь, что все зависимости установлены
3. Проверьте логи в консоли
4. Создайте Issue в репозитории

## 🔮 Планы развития

- [ ] Редактирование профиля
- [ ] Управление пользователями (для админов)
- [ ] Уведомления
- [ ] Темная тема
- [ ] Многоязычность
- [ ] Push-уведомления
- [ ] Офлайн режим

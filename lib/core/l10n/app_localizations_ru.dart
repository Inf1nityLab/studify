import 'app_localizations.dart';

class AppLocalizationsRu extends AppLocalizations {
  // App
  @override
  String get appName => 'Studify';

  @override
  String get appVersion => 'Версия 1.0.0';

  @override
  String get appSubtitle => 'Будущее образования';

  // Settings
  @override
  String get settings => 'Настройки';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get language => 'Язык';

  @override
  String get switchToLightTheme => 'Переключить на светлую тему';

  @override
  String get switchToDarkTheme => 'Переключить на тёмную тему';

  @override
  String get currentTheme => 'Текущая тема';

  @override
  String get lightTheme => 'Светлая тема';

  @override
  String get darkTheme => 'Тёмная тема';

  @override
  String get systemTheme => 'Системная тема';

  @override
  String get goToSignIn => 'Перейти к входу';

  // Auth
  @override
  String get signIn => 'Войти';

  @override
  String get signUp => 'Регистрация';

  @override
  String get welcome => 'Добро пожаловать!';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get signInSubtitle => 'Войди в свой аккаунт и начни учиться';

  @override
  String get signUpSubtitle => 'Присоединяйся к нам и начни учиться';

  @override
  String get email => 'Email';

  @override
  String get password => 'Пароль';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get fullName => 'Полное имя';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get forgotPasswordSubtitle => 'Не волнуйся! Введи свой email и мы отправим инструкции для восстановления пароля.';

  @override
  String get sendInstructions => 'Отправить инструкции';

  @override
  String get emailSentTitle => 'Письмо отправлено!';

  @override
  String get emailSentSubtitle => 'Проверь свою почту! Мы отправили инструкции для восстановления пароля.';

  @override
  String get emailSentCheck => 'Проверь папку "Входящие" или "Спам"';

  @override
  String get rememberPassword => 'Вспомнили пароль? ';

  @override
  String get rememberMe => 'Запомнить меня';

  @override
  String get noAccount => 'Нет аккаунта? ';

  @override
  String get haveAccount => 'Уже есть аккаунт? ';

  @override
  String get signInButton => 'Войти';

  @override
  String get signUpButton => 'Зарегистрироваться';

  @override
  String get createAccountButton => 'Создать аккаунт';

  @override
  String get agreeToTerms => 'Я согласен с ';

  @override
  String get termsAndPolicy => 'условиями и политикой';

  // Validation
  @override
  String get emailRequired => 'Email обязателен';

  @override
  String get emailInvalid => 'Введите корректный email';

  @override
  String get passwordRequired => 'Пароль обязателен';

  @override
  String get passwordMinLength => 'Пароль должен содержать минимум 6 символов';

  @override
  String get passwordsNotMatch => 'Пароли не совпадают';

  @override
  String get nameRequired => 'Имя обязательно';

  @override
  String get nameMinLength => 'Имя должно содержать минимум 2 символа';

  // Navigation
  @override
  String get backToHome => 'Вернуться на главную';

  @override
  String get pageNotFound => 'Страница не найдена';

  // Navigation Items
  @override
  String get schedule => 'Расписание';

  @override
  String get statistics => 'Статистика';

  @override
  String get createGroup => 'Создать группу';

  @override
  String get video => 'Видео';

  @override
  String get profile => 'Профиль';

  @override
  String get school => 'Школа';

  @override
  String get studio => 'Студия';

  // Navigation UI
  @override
  String get backToSettings => 'Назад к настройкам';

  @override
  String get sidebarCollapse => 'Свернуть';

  @override
  String get sidebarExpand => 'Развернуть';

  @override
  String get logout => 'Выход';

  @override
  String get educationFuture => 'Образование будущего';

  // School Creation
  @override
  String get createSchool => 'Создать школу';

  @override
  String get createSchoolSubtitle => 'Заполните информацию о вашей школе';

  @override
  String get schoolName => 'Название школы';

  @override
  String get schoolNameHint => 'Название школы';

  @override
  String get schoolNameRequired => 'Введите название школы';

  @override
  String get selectSubjects => 'Выберите предметы';

  @override
  String get selectDirections => 'Выберите направления';

  @override
  String get noSubjectsSelected => 'Не выбрано';

  @override
  String get noDirectionsSelected => 'Не выбрано';

  @override
  String get subjectsCount => 'предметов';

  @override
  String get directionsCount => 'направлений';

  @override
  String get learningType => 'Тип обучения';

  @override
  String get online => 'Онлайн';

  @override
  String get offline => 'Офлайн';

  @override
  String get schoolAddress => 'Адрес школы';

  @override
  String get schoolAddressHint => 'Адрес школы';

  @override
  String get schoolAddressRequired => 'Введите адрес школы';

  @override
  String get numberOfRooms => 'Количество кабинетов';

  @override
  String get numberOfRoomsHint => 'Количество кабинетов';

  @override
  String get numberOfRoomsRequired => 'Введите количество кабинетов';

  @override
  String get numberOfRoomsInvalid => 'Введите число';

  @override
  String get logo => 'Логотип';

  @override
  String get selectLogo => 'Выберите логотип';

  @override
  String get uploadImage => 'Загрузить изображение';

  @override
  String get cancel => 'Отмена';

  @override
  String get schoolCreatedSuccess => 'Школа успешно создана!';

  @override
  String get createSchoolButton => 'Создать школу';

  // Dialog
  @override
  String get search => 'Поиск...';

  @override
  String get selected => 'Выбрано';

  @override
  String get done => 'Готово';
} 
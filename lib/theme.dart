



// // Основные цвета приложения
// class AppColors {
//   // Основные цвета градиентов
//   static const Color primaryGradientStart = Color(0xFF667EEA);
//   static const Color primaryGradientMiddle = Color(0xFF764BA2);
//   static const Color primaryGradientEnd = Color(0xFFF093FB);
//
//   // Элегантные цвета для desktop
//   static const Color desktopPrimary = Color(0xFF2563EB);
//   static const Color desktopSecondary = Color(0xFF7C3AED);
//   static const Color desktopAccent = Color(0xFF06B6D4);
//   static const Color desktopSuccess = Color(0xFF10B981);
//   static const Color desktopWarning = Color(0xFFF59E0B);
//   static const Color desktopError = Color(0xFFEF4444);
//
//   // Цвета для ошибок
//   static const Color errorColor = Color(0xFFEF4444);
//   static const Color errorColorLight = Color(0xFFFEE2E2);
//
//   // Темная тема
//   static const Color darkBackground = Color(0xFF0F172A);
//   static const Color darkCardColor = Color(0xFF1E293B);
//   static const Color darkTextColor = Colors.white;
//   static const Color darkHintColor = Color(0x99FFFFFF);
//   static const Color darkBorderColor = Color(0x26FFFFFF);
//
//   // Светлая тема
//   static const Color lightBackground = Color(0xFFF8FAFC);
//   static const Color lightCardColor = Colors.white;
//   static const Color lightTextColor = Color(0xFF1E293B);
//   static const Color lightHintColor = Color(0x99000000);
//   static const Color lightBorderColor = Color(0x1A000000);
//
//   // Цвета для sidebar
//   static const Color desktopSidebarBackground = Color(0xFF1E293B);
//   static const Color desktopSidebarActive = Color(0xFF3B82F6);
//   static const Color desktopSidebarInactive = Color(0xFF94A3B8);
//   static const Color desktopSidebarBorder = Color(0xFF334155);
//
//   static const Color sidebarLightBackground = Color(0xFFFFFFFF);
//   static const Color sidebarLightActive = Color(0xFF2563EB);
//   static const Color sidebarLightInactive = Color(0xFF64748B);
//   static const Color sidebarLightBorder = Color(0xFFE2E8F0);
// }
//
// // Градиенты
// class AppGradients {
//   static const LinearGradient primaryGradient = LinearGradient(
//     colors: [AppColors.primaryGradientStart, AppColors.primaryGradientMiddle, AppColors.primaryGradientEnd],
//   );
//
//   static const LinearGradient primaryGradientTwo = LinearGradient(
//     colors: [AppColors.primaryGradientStart, AppColors.primaryGradientMiddle],
//   );
//
//   // Элегантные градиенты для desktop
//   static const LinearGradient desktopGradient = LinearGradient(
//     colors: [AppColors.desktopPrimary, AppColors.desktopSecondary],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );
//
//   static const LinearGradient desktopGradientVertical = LinearGradient(
//     colors: [AppColors.desktopPrimary, AppColors.desktopSecondary, AppColors.desktopAccent],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   );
//
//   static const LinearGradient successGradient = LinearGradient(
//     colors: [AppColors.desktopSuccess, AppColors.desktopAccent],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );
//
//   static LinearGradient primaryGradientWithOpacity(double opacity) {
//     return LinearGradient(
//       colors: [
//         AppColors.primaryGradientStart.withOpacity(opacity),
//         AppColors.primaryGradientMiddle.withOpacity(opacity),
//       ],
//     );
//   }
//
//   static LinearGradient desktopGradientWithOpacity(double opacity) {
//     return LinearGradient(
//       colors: [
//         AppColors.desktopPrimary.withOpacity(opacity),
//         AppColors.desktopSecondary.withOpacity(opacity),
//       ],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     );
//   }
// }
//
// // Тени
// class AppShadows {
//   static List<BoxShadow> getCardShadow(bool isDarkMode) {
//     return [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.1),
//         blurRadius: 8,
//         offset: const Offset(0, 4),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> getButtonShadow() {
//     return [
//       BoxShadow(
//         color: AppColors.primaryGradientStart.withOpacity(0.4),
//         blurRadius: 20,
//         offset: const Offset(0, 10),
//       ),
//     ];
//   }
//
//   // Элегантные тени для desktop
//   static List<BoxShadow> getDesktopCardShadow() {
//     return [
//       BoxShadow(
//         color: AppColors.desktopPrimary.withOpacity(0.1),
//         blurRadius: 20,
//         offset: const Offset(0, 8),
//       ),
//       BoxShadow(
//         color: AppColors.desktopSecondary.withOpacity(0.05),
//         blurRadius: 40,
//         offset: const Offset(0, 16),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> getFocusShadow() {
//     return [
//       BoxShadow(
//         color: AppColors.primaryGradientStart.withOpacity(0.2),
//         blurRadius: 12,
//         offset: const Offset(0, 4),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> getErrorShadow() {
//     return [
//       BoxShadow(
//         color: AppColors.errorColor.withOpacity(0.2),
//         blurRadius: 12,
//         offset: const Offset(0, 4),
//       ),
//     ];
//   }
//
//   // Desktop версии теней
//   static List<BoxShadow> getDesktopFocusShadow() {
//     return [
//       BoxShadow(
//         color: AppColors.desktopPrimary.withOpacity(0.3),
//         blurRadius: 16,
//         offset: const Offset(0, 6),
//       ),
//       BoxShadow(
//         color: AppColors.desktopSecondary.withOpacity(0.1),
//         blurRadius: 32,
//         offset: const Offset(0, 12),
//       ),
//     ];
//   }
//
//   static List<BoxShadow> getDesktopErrorShadow() {
//     return [
//       BoxShadow(
//         color: AppColors.errorColor.withOpacity(0.3),
//         blurRadius: 16,
//         offset: const Offset(0, 6),
//       ),
//       BoxShadow(
//         color: AppColors.errorColor.withOpacity(0.1),
//         blurRadius: 32,
//         offset: const Offset(0, 12),
//       ),
//     ];
//   }
// }
//
// // Утилиты для получения цветов
// class AppColorUtils {
//   static Color getBackgroundColor(bool isDarkMode) {
//     return isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
//   }
//
//   static Color getCardColor(bool isDarkMode) {
//     return isDarkMode ? AppColors.darkCardColor : AppColors.lightCardColor;
//   }
//
//   static Color getTextColor(bool isDarkMode) {
//     return isDarkMode ? AppColors.darkTextColor : AppColors.lightTextColor;
//   }
//
//   static Color getHintColor(bool isDarkMode) {
//     return isDarkMode ? AppColors.darkHintColor : AppColors.lightHintColor;
//   }
//
//   static Color getBorderColor(bool isDarkMode) {
//     return isDarkMode ? AppColors.darkBorderColor : AppColors.lightBorderColor;
//   }
// }
//
// // Стили текста
// class AppTextStyles {
//   static TextStyle getTitleStyle(bool isDarkMode) {
//     return TextStyle(
//       fontSize: 32,
//       fontWeight: FontWeight.w800,
//       color: AppColorUtils.getTextColor(isDarkMode),
//       letterSpacing: 0.5,
//     );
//   }
//
//   static TextStyle getSubtitleStyle(bool isDarkMode) {
//     return TextStyle(
//       fontSize: 16,
//       color: AppColorUtils.getHintColor(isDarkMode),
//       fontWeight: FontWeight.w400,
//     );
//   }
//
//   static TextStyle getButtonTextStyle() {
//     return const TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w700,
//       color: Colors.white,
//       letterSpacing: 0.5,
//     );
//   }
//
//   static TextStyle getLinkTextStyle() {
//     return const TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w700,
//       color: Colors.white,
//     );
//   }
//
//   static TextStyle getErrorTextStyle() {
//     return TextStyle(
//       color: AppColors.errorColor,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//     );
//   }
//
//   // Элегантные стили для desktop
//   static TextStyle getDesktopTitleStyle(bool isDarkMode) {
//     return TextStyle(
//       fontSize: 42,
//       fontWeight: FontWeight.w900,
//       color: AppColorUtils.getTextColor(isDarkMode),
//       letterSpacing: 0.8,
//     );
//   }
//
//   static TextStyle getDesktopSubtitleStyle(bool isDarkMode) {
//     return TextStyle(
//       fontSize: 18,
//       color: AppColorUtils.getHintColor(isDarkMode),
//       fontWeight: FontWeight.w500,
//       letterSpacing: 0.2,
//     );
//   }
//
//   static TextStyle getDesktopButtonTextStyle() {
//     return const TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w700,
//       color: Colors.white,
//       letterSpacing: 0.5,
//     );
//   }
//
//   static TextStyle getTextStyle(bool isDarkMode) {
//     return TextStyle(
//       color: AppColorUtils.getTextColor(isDarkMode),
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//     );
//   }
// }
//
// // Responsive утилиты
// class AppResponsive {
//   static double getResponsiveWidth(BuildContext context, double percentage) {
//     return MediaQuery.of(context).size.width * percentage;
//   }
//
//   static double getResponsiveHeight(BuildContext context, double percentage) {
//     return MediaQuery.of(context).size.height * percentage;
//   }
//
//   static bool isDesktop(BuildContext context) {
//     return MediaQuery.of(context).size.width > 1024;
//   }
//
//   static bool isTablet(BuildContext context) {
//     return MediaQuery.of(context).size.width > 768 &&
//         MediaQuery.of(context).size.width <= 1024;
//   }
//
//   static bool isMobile(BuildContext context) {
//     return MediaQuery.of(context).size.width <= 768;
//   }
//
//   // Responsive отступы
//   static EdgeInsets getResponsivePadding(BuildContext context) {
//     if (isDesktop(context)) {
//       return const EdgeInsets.all(40);
//     } else if (isTablet(context)) {
//       return const EdgeInsets.all(24);
//     } else {
//       return const EdgeInsets.all(20);
//     }
//   }
//
//   // Responsive размеры контейнеров
//   static double getMaxContentWidth(BuildContext context) {
//     if (isDesktop(context)) {
//       return 1200;
//     } else if (isTablet(context)) {
//       return 800;
//     } else {
//       return double.infinity;
//     }
//   }
// }
//
// // Основной класс темы
// class AppTheme {
//   // Получение полной светлой темы
//   static ThemeData getLightTheme() {
//     return ThemeData.light().copyWith(
//       scaffoldBackgroundColor: AppColors.lightBackground,
//       cardColor: AppColors.lightCardColor,
//       primaryColor: AppColors.desktopPrimary,
//       brightness: Brightness.light,
//       colorScheme: ColorScheme.light(
//         brightness: Brightness.light,
//         background: AppColors.lightBackground,
//         surface: AppColors.lightCardColor,
//         primary: AppColors.desktopPrimary,
//         secondary: AppColors.desktopSecondary,
//         onBackground: AppColors.lightTextColor,
//         onSurface: AppColors.lightTextColor,
//         error: AppColors.errorColor,
//         onPrimary: Colors.white,
//         onSecondary: Colors.white,
//       ),
//       textTheme: GoogleFonts.latoTextTheme().copyWith(
//         bodyLarge: TextStyle(color: AppColors.lightTextColor),
//         bodyMedium: TextStyle(color: AppColors.lightTextColor),
//         titleLarge: TextStyle(color: AppColors.lightTextColor),
//         titleMedium: TextStyle(color: AppColors.lightTextColor),
//       ),
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColors.lightBackground,
//         foregroundColor: AppColors.lightTextColor,
//         elevation: 0,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.desktopPrimary,
//           foregroundColor: Colors.white,
//           minimumSize: const Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Получение полной темной темы
//   static ThemeData getDarkTheme() {
//     return ThemeData.dark().copyWith(
//       scaffoldBackgroundColor: AppColors.darkBackground,
//       cardColor: AppColors.darkCardColor,
//       primaryColor: AppColors.desktopPrimary,
//       brightness: Brightness.dark,
//       colorScheme: ColorScheme.dark(
//         brightness: Brightness.dark,
//         background: AppColors.darkBackground,
//         surface: AppColors.darkCardColor,
//         primary: AppColors.desktopPrimary,
//         secondary: AppColors.desktopSecondary,
//         onBackground: AppColors.darkTextColor,
//         onSurface: AppColors.darkTextColor,
//         error: AppColors.errorColor,
//         onPrimary: Colors.white,
//         onSecondary: Colors.white,
//       ),
//       textTheme: GoogleFonts.latoTextTheme().copyWith(
//         bodyLarge: TextStyle(color: AppColors.darkTextColor),
//         bodyMedium: TextStyle(color: AppColors.darkTextColor),
//         titleLarge: TextStyle(color: AppColors.darkTextColor),
//         titleMedium: TextStyle(color: AppColors.darkTextColor),
//       ),
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColors.darkBackground,
//         foregroundColor: AppColors.darkTextColor,
//         elevation: 0,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.desktopPrimary,
//           foregroundColor: Colors.white,
//           minimumSize: const Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Глобальный менеджер темы
// class ThemeManager {
//   static bool _isDarkMode = true; // По умолчанию темная тема
//
//   static bool get isDarkMode => _isDarkMode;
//
//   static void toggleTheme() {
//     _isDarkMode = !_isDarkMode;
//   }
//
//   static void setTheme(bool isDark) {
//     _isDarkMode = isDark;
//   }
//
//   static ThemeData get currentTheme => _isDarkMode ? AppTheme.getDarkTheme() : AppTheme.getLightTheme();
// }
//
// // Устаревшие функции для обратной совместимости
// TextTheme buildTextTheme(BuildContext context) {
//   final baseTextTheme = Theme.of(context).textTheme;
//   return GoogleFonts.latoTextTheme(baseTextTheme).copyWith(
//     headlineSmall: GoogleFonts.montserrat(
//       textStyle: baseTextTheme.headlineSmall?.copyWith(fontSize: 22),
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextColor,
//     ),
//     titleLarge: GoogleFonts.montserrat(
//       textStyle: baseTextTheme.titleLarge?.copyWith(fontSize: 18),
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextColor,
//     ),
//     titleMedium: GoogleFonts.lato(
//       textStyle: baseTextTheme.titleMedium?.copyWith(fontSize: 18),
//       fontWeight: FontWeight.w600,
//       color: AppColors.desktopPrimary,
//     ),
//     bodyLarge: GoogleFonts.lato(
//       textStyle: baseTextTheme.bodyLarge?.copyWith(fontSize: 16),
//       color: AppColors.lightHintColor,
//       height: 1.6,
//     ),
//     bodyMedium: GoogleFonts.lato(
//       textStyle: baseTextTheme.bodyMedium,
//       color: AppColors.lightTextColor,
//       fontSize: 16,
//       height: 1.5,
//     ),
//     titleSmall: GoogleFonts.montserrat(
//       textStyle: baseTextTheme.titleSmall,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextColor,
//       fontSize: 17,
//     ),
//     bodySmall: GoogleFonts.lato(
//       textStyle: baseTextTheme.bodySmall,
//       color: AppColors.lightHintColor,
//       fontSize: 14,
//     ),
//   ).apply(bodyColor: AppColors.lightTextColor, displayColor: AppColors.lightTextColor);
// }
//
// ButtonStyle primaryButtonStyle(TextTheme textTheme) {
//   return ElevatedButton.styleFrom(
//     backgroundColor: AppColors.desktopPrimary,
//     foregroundColor: Colors.white,
//     minimumSize: const Size(double.infinity, 50),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     textStyle: textTheme.titleSmall?.copyWith(
//       color: Colors.white,
//       fontSize: 16,
//     ),
//   );
// }
//
// ButtonStyle secondaryButtonStyle(TextTheme textTheme) {
//   return ElevatedButton.styleFrom(
//     backgroundColor: Colors.grey[200],
//     foregroundColor: Colors.black87,
//     minimumSize: const Size(double.infinity, 50),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     textStyle: textTheme.titleSmall?.copyWith(fontSize: 16),
//   );
// }
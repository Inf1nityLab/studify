import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/mobile_animation_mixin.dart';
import '../../widgets/select_school_group_controller.dart';
import '../../widgets/select_school_group_form.dart';


class SelectSchoolGroupMobileScreen extends StatefulWidget {
  final SelectSchoolGroupController controller;

  const SelectSchoolGroupMobileScreen({
    super.key,
    required this.controller,
  });

  @override
  State<SelectSchoolGroupMobileScreen> createState() => _SelectSchoolGroupMobileScreenState();
}

class _SelectSchoolGroupMobileScreenState extends State<SelectSchoolGroupMobileScreen>
    with TickerProviderStateMixin, MobileAnimationMixin {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  // Заголовок
                  Text(
                    'Выберите школу или группу',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Введите код школы или группы для присоединения',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Форма ввода кода и отображение результата
                  SelectSchoolGroupForm(
                    controller: widget.controller,
                    isDesktop: false,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 
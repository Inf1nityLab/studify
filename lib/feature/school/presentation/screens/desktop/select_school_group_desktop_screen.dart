import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/desktop_left_panel.dart';
import '../../../../../core/widgets/desktop_right_panel.dart';
import '../../widgets/select_school_group_controller.dart';
import '../../widgets/select_school_group_form.dart';


class SelectSchoolGroupDesktopScreen extends StatelessWidget {
  final SelectSchoolGroupController controller;

  const SelectSchoolGroupDesktopScreen({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          // Левая панель
          DesktopLeftPanel(
            title: 'Studify',
            subtitle: 'Присоединяйтесь к школам и группам',
            logoIcon: Icons.qr_code,
          ),

          // Правая панель
          DesktopRightPanel(
            title: 'Выберите школу или группу',
            subtitle: 'Введите код школы или группы для присоединения',
            formContent: SelectSchoolGroupForm(
              controller: controller,
              isDesktop: true,
            ),
          ),
        ],
      ),
    );
  }
} 
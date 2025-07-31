import 'package:flutter/material.dart';
import '../../../../../core/widgets/desktop_left_panel.dart';
import '../../../../../core/widgets/desktop_right_panel.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../widgets/create_school_form.dart';
import '../../widgets/create_school_controller.dart';

class CreateSchoolDesktopScreen extends StatelessWidget {
  final CreateSchoolController controller;
  
  const CreateSchoolDesktopScreen({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          // Левая панель
          DesktopLeftPanel(
            title: 'Studify',
            subtitle: l10n.createSchoolSubtitle,
            logoIcon: Icons.school,
          ),
          
          // Правая панель
          DesktopRightPanel(
            title: l10n.createSchool,
            subtitle: l10n.createSchoolSubtitle,
            formContent: CreateSchoolForm(
              isDesktop: true,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
} 
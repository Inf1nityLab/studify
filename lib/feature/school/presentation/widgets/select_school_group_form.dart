import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import 'select_school_group_controller.dart';
import 'group_card.dart';
import 'school_card.dart';

class SelectSchoolGroupForm extends StatelessWidget {
  final SelectSchoolGroupController controller;
  final bool isDesktop;

  const SelectSchoolGroupForm({
    super.key,
    required this.controller,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final theme = Theme.of(context);
        final l10n = AppLocalizations.of(context);
        final isLoading = controller.isLoading;

        final selectedItem = controller.selectedItem;
        final isCodeValid = controller.isCodeValid;

        return Column(
          children: [
            Form(
              child: Column(
                children: [
                  // Поле ввода кода
                  UniversalTextField(
                    controller: controller.codeController,
                    hintText: 'Введите код школы или группы',
                    icon: Icons.qr_code_outlined,
                    theme: theme,
                    isDesktop: isDesktop,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите код';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: isDesktop ? 24 : 36),

                  // Кнопка проверки кода
                  UniversalActionButton(
                    onPressed: isLoading ? null : controller.validateCode,
                    isLoading: isLoading,
                    text: 'Проверить код',
                    isDesktop: isDesktop,
                    height: isDesktop ? 48 : 56,
                  ),
                ],
              ),
            ),

            // Отображение карточки результата
            if (isCodeValid && selectedItem != null) ...[
              SizedBox(height: isDesktop ? 32 : 48),
              if (selectedItem['type'] == 'group')
                GroupCard(
                  groupData: selectedItem,
                  isDesktop: isDesktop,
                )
              else if (selectedItem['type'] == 'school')
                SchoolCard(
                  schoolData: selectedItem,
                  isDesktop: isDesktop,
                ),
            ],
          ],
        );
      },
    );
  }
} 
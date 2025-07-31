import 'package:flutter/material.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../../../../core/widgets/universal_checkbox.dart';
import '../../../../../core/widgets/universal_action_button.dart';
import '../../../../../core/l10n/app_localizations.dart';
import 'logo_picker.dart';
import 'select_list_dialog.dart';
import 'create_school_controller.dart';

class CreateSchoolForm extends StatefulWidget {
  final bool isDesktop;
  final CreateSchoolController controller;

  const CreateSchoolForm({
    super.key,
    required this.isDesktop,
    required this.controller,
  });

  @override
  State<CreateSchoolForm> createState() => _CreateSchoolFormState();
}

class _CreateSchoolFormState extends State<CreateSchoolForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return _buildForm();
      },
    );
  }

  Widget _buildForm() {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Логотип
          Center(
            child: LogoPicker(
              selectedLogo: widget.controller.selectedLogo,
              onLogoSelected: (logo) {
                widget.controller.setSelectedLogo(logo);
              },
            ),
          ),

          SizedBox(height: widget.isDesktop ? 24 : 32),

          // Название школы
          UniversalTextField(
            controller: widget.controller.schoolNameController,
            hintText: l10n.schoolNameHint,
            icon: Icons.school_outlined,
            theme: theme,
            isDesktop: widget.isDesktop,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.schoolNameRequired;
              }
              return null;
            },
          ),

          SizedBox(height: widget.isDesktop ? 16 : 24),

          // Выбор предметов
          _buildSelectionButton(
            l10n.selectSubjects,
            widget.controller.selectedSubjects.isEmpty ? l10n.noSubjectsSelected : '${widget.controller.selectedSubjects.length} ${l10n.subjectsCount}',
            Icons.book_outlined,
            _selectSubjects,
            theme,
          ),

          if (widget.controller.selectedSubjects.isNotEmpty) ...[
            SizedBox(height: widget.isDesktop ? 12 : 16),
            _buildSelectedChips(widget.controller.selectedSubjects, theme),
          ],

          SizedBox(height: widget.isDesktop ? 16 : 24),

          // Выбор направлений
          _buildSelectionButton(
            l10n.selectDirections,
            widget.controller.selectedDirections.isEmpty ? l10n.noDirectionsSelected : '${widget.controller.selectedDirections.length} ${l10n.directionsCount}',
            Icons.trending_up_outlined,
            _selectDirections,
            theme,
          ),

          if (widget.controller.selectedDirections.isNotEmpty) ...[
            SizedBox(height: widget.isDesktop ? 12 : 16),
            _buildSelectedChips(widget.controller.selectedDirections, theme),
          ],

          SizedBox(height: widget.isDesktop ? 16 : 24),

          // Тип обучения
          Text(
            l10n.learningType,
            style: TextStyle(
              fontSize: widget.isDesktop ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),

          SizedBox(height: widget.isDesktop ? 8 : 12),

          Row(
            children: [
              Expanded(
                child: _buildTypeCheckbox(
                  l10n.online,
                  widget.controller.isOnline,
                  widget.controller.toggleOnline,
                  Icons.computer_outlined,
                  theme,
                ),
              ),
              SizedBox(width: widget.isDesktop ? 12 : 16),
              Expanded(
                child: _buildTypeCheckbox(
                  l10n.offline,
                  widget.controller.isOffline,
                  widget.controller.toggleOffline,
                  Icons.location_on_outlined,
                  theme,
                ),
              ),
            ],
          ),

          // Офлайн информация
          if (widget.controller.isOffline) ...[
            SizedBox(height: widget.isDesktop ? 16 : 24),
            UniversalTextField(
              controller: widget.controller.addressController,
              hintText: l10n.schoolAddressHint,
              icon: Icons.location_on_outlined,
              theme: theme,
              isDesktop: widget.isDesktop,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.schoolAddressRequired;
                }
                return null;
              },
            ),

            SizedBox(height: widget.isDesktop ? 12 : 20),

            UniversalTextField(
              controller: widget.controller.roomsController,
              hintText: l10n.numberOfRoomsHint,
              icon: Icons.meeting_room_outlined,
              theme: theme,
              isDesktop: widget.isDesktop,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.numberOfRoomsRequired;
                }
                if (int.tryParse(value) == null) {
                  return l10n.numberOfRoomsInvalid;
                }
                return null;
              },
            ),
          ],

          // Кнопка создания (для обеих версий)
          SizedBox(height: widget.isDesktop ? 24 : 40),
          UniversalActionButton(
            onPressed: _createSchool,
            isLoading: false,
            text: l10n.createSchoolButton,
            isDesktop: widget.isDesktop,
            height: widget.isDesktop ? 48 : 56,
          ),
        ],
      ),
    );
  }

  void _selectSubjects() async {
    final l10n = AppLocalizations.of(context);
    
    final result = await showDialog<List<String>>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) => SelectListDialog(
        title: l10n.selectSubjects,
        items: [
          'Английский язык',
          'Немецкий язык', 
          'Математика',
          'Физика',
          'Химия',
          'Биология',
          'История',
          'География',
        ],
        selectedItems: widget.controller.selectedSubjects,
      ),
    );

    if (result != null) {
      widget.controller.setSelectedSubjects(result);
    }
  }

  void _selectDirections() async {
    final l10n = AppLocalizations.of(context);
    
    final result = await showDialog<List<String>>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) => SelectListDialog(
        title: l10n.selectDirections,
        items: [
          'TOEFL',
          'IELTS',
          'Математика 1 класс',
          'Математика 2 класс',
          'Математика 3 класс',
          'Математика 4 класс',
          'Подготовка к ЕГЭ',
          'Подготовка к ОГЭ',
        ],
        selectedItems: widget.controller.selectedDirections,
      ),
    );

    if (result != null) {
      widget.controller.setSelectedDirections(result);
    }
  }

  void _createSchool() {
    if (_formKey.currentState!.validate()) {
      final l10n = AppLocalizations.of(context);
      
      // Логика создания школы
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.schoolCreatedSuccess),
          backgroundColor: Colors.green,
        ),
      );
      
      // Здесь можно добавить навигацию или другую логику
      // Например: context.go('/dashboard');
    }
  }

  Widget _buildSelectionButton(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
    ThemeData theme,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(widget.isDesktop ? 12 : 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isDesktop ? 12 : 16),
          color: theme.colorScheme.surface,
          border: Border.all(
            color: theme.colorScheme.outline,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(widget.isDesktop ? 0.05 : 0.1),
              blurRadius: widget.isDesktop ? 4 : 8,
              offset: Offset(0, widget.isDesktop ? 2 : 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.primary,
              size: widget.isDesktop ? 20 : 24,
            ),
            SizedBox(width: widget.isDesktop ? 12 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: widget.isDesktop ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: widget.isDesktop ? 2 : 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: widget.isDesktop ? 12 : 14,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: theme.colorScheme.onSurface.withOpacity(0.4),
              size: widget.isDesktop ? 14 : 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedChips(List<String> items, ThemeData theme) {
    return Wrap(
      spacing: widget.isDesktop ? 6 : 8,
      runSpacing: widget.isDesktop ? 6 : 8,
      children: items.map((item) => Chip(
        label: Text(
          item,
          style: TextStyle(
            fontSize: widget.isDesktop ? 11 : 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        deleteIcon: Icon(
          Icons.close,
          color: Colors.white,
          size: widget.isDesktop ? 14 : 16,
        ),
        onDeleted: () {
          if (items == widget.controller.selectedSubjects) {
            widget.controller.removeSubject(item);
          } else if (items == widget.controller.selectedDirections) {
            widget.controller.removeDirection(item);
          }
        },
      )).toList(),
    );
  }

  Widget _buildTypeCheckbox(
    String label,
    bool value,
    VoidCallback onTap,
    IconData icon,
    ThemeData theme,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(widget.isDesktop ? 12 : 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isDesktop ? 8 : 12),
          color: value ? theme.colorScheme.primary.withOpacity(0.1) : theme.colorScheme.surface,
          border: Border.all(
            color: value ? theme.colorScheme.primary : theme.colorScheme.outline,
            width: value ? 2 : 1.5,
          ),
        ),
        child: Column(
          children: [
            UniversalCheckbox(
              value: value,
              onTap: onTap,
              theme: theme,
              isDesktop: widget.isDesktop,
              size: widget.isDesktop ? 18 : 24,
            ),
            SizedBox(height: widget.isDesktop ? 6 : 8),
            Icon(
              icon,
              color: value ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.6),
              size: widget.isDesktop ? 18 : 24,
            ),
            SizedBox(height: widget.isDesktop ? 6 : 8),
            Text(
              label,
              style: TextStyle(
                fontSize: widget.isDesktop ? 12 : 14,
                fontWeight: FontWeight.w600,
                color: value ? theme.colorScheme.primary : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
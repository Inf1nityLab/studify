import 'package:flutter/material.dart';

import '../../../../../core/widgets/universal_action_button.dart';
import '../../../../../core/widgets/universal_text_field.dart';
import '../../widgets/subject_card.dart';
import '../../widgets/direction_card.dart';
import '../../widgets/logo_picker.dart';
import '../../widgets/select_list_screen.dart';

class CreateSchoolMobileScreen extends StatefulWidget {
  const CreateSchoolMobileScreen({super.key});

  @override
  State<CreateSchoolMobileScreen> createState() => _CreateSchoolMobileScreenState();
}

class _CreateSchoolMobileScreenState extends State<CreateSchoolMobileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();

  final List<String> _allSubjects = [
    'Математика', 'Физика', 'Химия', 'Биология', 'История', 'Литература', 'Информатика', 'География',
  ];
  final List<String> _allDirections = [
    'Техническое', 'Гуманитарное', 'Естественнонаучное', 'Спортивное', 'Творческое',
  ];

  final List<String> _selectedSubjects = [];
  final List<String> _selectedDirections = [];
  bool _isOnline = false;
  bool _isOffline = false;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _roomsController.dispose();
    super.dispose();
  }

  void _showSubjectsScreen() async {
    final result = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        builder: (context) => SelectListScreen(
          allItems: _allSubjects,
          selected: _selectedSubjects,
          title: 'Выберите предметы',
        ),
      ),
    );
    if (result != null) {
      setState(() => _selectedSubjects
        ..clear()
        ..addAll(result));
    }
  }

  void _showDirectionsScreen() async {
    final result = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        builder: (context) => SelectListScreen(
          allItems: _allDirections,
          selected: _selectedDirections,
          title: 'Выберите направления',
        ),
      ),
    );
    if (result != null) {
      setState(() => _selectedDirections
        ..clear()
        ..addAll(result));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать школу'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Логотип (иконка)
            Center(child: LogoPicker()),
            const SizedBox(height: 32),
            // Название школы
            Text('Название школы', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 6),
            UniversalTextField(
              controller: _nameController,
              hintText: 'Название школы',
              icon: Icons.edit,
              theme: theme,
              isDesktop: false,
            ),
            const SizedBox(height: 20),
            // Выбор предметов
            Text('Предметы', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            if (_selectedSubjects.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: _selectedSubjects.map((s) => Chip(
                  label: Text(s, style: TextStyle(color: theme.colorScheme.onPrimary)),
                  avatar: Icon(Icons.check, color: theme.colorScheme.onPrimary, size: 18),
                  backgroundColor: theme.colorScheme.primary,
                  deleteIcon: Icon(Icons.close, color: theme.colorScheme.onPrimary, size: 18),
                  onDeleted: () {
                    setState(() => _selectedSubjects.remove(s));
                  },
                )).toList(),
              ),
              const SizedBox(height: 12),
            ],
            Align(
              alignment: Alignment.centerLeft,
              child: ActionChip(
                label: const Text('Выбрать предметы'),
                avatar: const Icon(Icons.add),
                onPressed: _showSubjectsScreen,
              ),
            ),
            const SizedBox(height: 20),
            // Выбор направлений
            Text('Направления', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            if (_selectedDirections.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: _selectedDirections.map((d) => Chip(
                  label: Text(d, style: TextStyle(color: theme.colorScheme.onSecondary)),
                  avatar: Icon(Icons.check, color: theme.colorScheme.onSecondary, size: 18),
                  backgroundColor: theme.colorScheme.secondary,
                  deleteIcon: Icon(Icons.close, color: theme.colorScheme.onSecondary, size: 18),
                  onDeleted: () {
                    setState(() => _selectedDirections.remove(d));
                  },
                )).toList(),
              ),
              const SizedBox(height: 12),
            ],
            Align(
              alignment: Alignment.centerLeft,
              child: ActionChip(
                label: const Text('Выбрать направления'),
                avatar: const Icon(Icons.add),
                onPressed: _showDirectionsScreen,
              ),
            ),
            const SizedBox(height: 20),
            // Формат обучения
            Text('Формат обучения', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _isOnline,
                  onChanged: (v) => setState(() => _isOnline = v ?? false),
                ),
                const Text('Онлайн'),
                const SizedBox(width: 16),
                Checkbox(
                  value: _isOffline,
                  onChanged: (v) => setState(() => _isOffline = v ?? false),
                ),
                const Text('Офлайн'),
              ],
            ),
            if (_isOffline) ...[
              Text('Адрес школы', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 6),
              UniversalTextField(
                controller: _addressController,
                hintText: 'Адрес школы',
                icon: Icons.location_on_outlined,
                theme: theme,
                isDesktop: false,
              ),
              const SizedBox(height: 20),
              Text('Количество кабинетов', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 6),
              UniversalTextField(
                controller: _roomsController,
                hintText: 'Количество кабинетов',
                icon: Icons.meeting_room_outlined,
                theme: theme,
                isDesktop: false,
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 36),
            UniversalActionButton(
              onPressed: () {},
              isLoading: false,
              text: 'Создать школу',
              isDesktop: false,
            ),
          ],
        ),
      ),
    );
  }
} 
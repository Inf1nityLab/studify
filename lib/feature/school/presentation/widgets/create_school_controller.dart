import 'package:flutter/material.dart';

class CreateSchoolController extends ChangeNotifier {
  final _schoolNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _roomsController = TextEditingController();
  
  // Состояние формы
  bool _isOnline = false;
  bool _isOffline = false;
  List<String> _selectedSubjects = [];
  List<String> _selectedDirections = [];
  String? _selectedLogo;

  // Геттеры для доступа к контроллерам
  TextEditingController get schoolNameController => _schoolNameController;
  TextEditingController get addressController => _addressController;
  TextEditingController get roomsController => _roomsController;

  // Геттеры для состояния
  bool get isOnline => _isOnline;
  bool get isOffline => _isOffline;
  List<String> get selectedSubjects => List.unmodifiable(_selectedSubjects);
  List<String> get selectedDirections => List.unmodifiable(_selectedDirections);
  String? get selectedLogo => _selectedLogo;

  // Методы для изменения состояния
  void toggleOnline() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void toggleOffline() {
    _isOffline = !_isOffline;
    notifyListeners();
  }

  void setSelectedSubjects(List<String> subjects) {
    _selectedSubjects = List.from(subjects);
    notifyListeners();
  }

  void setSelectedDirections(List<String> directions) {
    _selectedDirections = List.from(directions);
    notifyListeners();
  }

  void setSelectedLogo(String? logo) {
    _selectedLogo = logo;
    notifyListeners();
  }

  void removeSubject(String subject) {
    _selectedSubjects.remove(subject);
    notifyListeners();
  }

  void removeDirection(String direction) {
    _selectedDirections.remove(direction);
    notifyListeners();
  }

  // Метод для создания школы
  bool createSchool() {
    // Здесь будет логика создания школы
    // Пока просто возвращаем true для демонстрации
    return true;
  }

  // Метод для очистки формы
  void clearForm() {
    _schoolNameController.clear();
    _addressController.clear();
    _roomsController.clear();
    _isOnline = false;
    _isOffline = false;
    _selectedSubjects.clear();
    _selectedDirections.clear();
    _selectedLogo = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _schoolNameController.dispose();
    _addressController.dispose();
    _roomsController.dispose();
    super.dispose();
  }
} 
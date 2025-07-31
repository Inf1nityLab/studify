import 'package:flutter/material.dart';

class SelectSchoolGroupController extends ChangeNotifier {
  final _codeController = TextEditingController();
  bool _isLoading = false;
  bool _isCodeValid = false;
  Map<String, dynamic>? _selectedItem;

  // Getters
  TextEditingController get codeController => _codeController;
  bool get isLoading => _isLoading;
  bool get isCodeValid => _isCodeValid;
  Map<String, dynamic>? get selectedItem => _selectedItem;

  // Методы
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void validateCode() {
    final code = _codeController.text.trim();
    
    if (code.isEmpty) {
      _isCodeValid = false;
      _selectedItem = null;
      notifyListeners();
      return;
    }

    setLoading(true);

    // Имитация API запроса
    Future.delayed(const Duration(milliseconds: 800), () {
      if (code == '1234') {
        // Это код группы
        _selectedItem = {
          'type': 'group',
          'name': 'Группа по английскому языку',
          'subject': 'Английский язык',
          'direction': 'TOEFL',
          'code': '1234',
          'teacher': 'Анна Петрова',
        };
        _isCodeValid = true;
      } else if (code == '5678') {
        // Это код школы
        _selectedItem = {
          'type': 'school',
          'name': 'Школа иностранных языков "Лингва"',
          'code': '5678',
        };
        _isCodeValid = true;
      } else {
        _isCodeValid = false;
        _selectedItem = null;
      }
      
      setLoading(false);
    });
  }

  void clearSelection() {
    _selectedItem = null;
    _isCodeValid = false;
    notifyListeners();
  }

  void clearCode() {
    _codeController.clear();
    clearSelection();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
} 
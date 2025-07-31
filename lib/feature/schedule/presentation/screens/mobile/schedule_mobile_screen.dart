import 'package:flutter/material.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../widgets/schedule_card.dart';
import '../../widgets/horizontal_calendar.dart';
import '../../../domain/schedule_item.dart';

class ScheduleMobileScreen extends StatefulWidget {
  const ScheduleMobileScreen({super.key});

  @override
  State<ScheduleMobileScreen> createState() => _ScheduleMobileScreenState();
}

class _ScheduleMobileScreenState extends State<ScheduleMobileScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();
  late ScrollController _scrollController;
  bool _isCalendarVisible = true;
  double _lastScrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final currentPosition = _scrollController.position.pixels;
    final scrollDelta = currentPosition - _lastScrollPosition;
    const threshold = 5.0; // Уменьшил порог для более чувствительного срабатывания
    
    // Показываем календарь при скролле вверх (даже медленном)
    if (scrollDelta < -threshold && !_isCalendarVisible) {
      setState(() {
        _isCalendarVisible = true;
      });
    }
    // Скрываем календарь при скролле вниз (даже медленном)
    else if (scrollDelta > threshold && _isCalendarVisible) {
      setState(() {
        _isCalendarVisible = false;
      });
    }
    
    _lastScrollPosition = currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    // Тестовые данные с текущим временем
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    final List<ScheduleItem> scheduleList = [
      ScheduleItem(
        groupName: '10А',
        subjectName: 'Математика',
        teacherName: 'Иванова О.В.',
        startTime: today.add(const Duration(hours: 8, minutes: 30)),
        endTime: today.add(const Duration(hours: 9, minutes: 15)),
      ),
      ScheduleItem(
        groupName: '10А',
        subjectName: 'Физика',
        teacherName: 'Петров С.В.',
        startTime: today.add(const Duration(hours: 9, minutes: 25)),
        endTime: today.add(const Duration(hours: 10, minutes: 10)),
      ),
      ScheduleItem(
        groupName: '11Б',
        subjectName: 'История',
        teacherName: 'Сидорова Л.М.',
        startTime: today.add(const Duration(hours: 10, minutes: 20)),
        endTime: today.add(const Duration(hours: 11, minutes: 5)),
      ),
      ScheduleItem(
        groupName: '9В',
        subjectName: 'Литература',
        teacherName: 'Козлова А.И.',
        startTime: today.add(const Duration(hours: 11, minutes: 15)),
        endTime: today.add(const Duration(hours: 12, minutes: 0)),
      ),
      ScheduleItem(
        groupName: '8А',
        subjectName: 'Химия',
        teacherName: 'Морозов Д.С.',
        startTime: today.add(const Duration(hours: 12, minutes: 10)),
        endTime: today.add(const Duration(hours: 12, minutes: 55)),
      ),
    ];

    return Column(
      children: [
        // Анимированный календарь с плавным сдвигом
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: _isCalendarVisible ? null : 0, // Изменяем высоту контейнера
          child: ClipRect(
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              offset: _isCalendarVisible ? Offset.zero : const Offset(0, -1),
              child: HorizontalCalendar(
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                  // Здесь можно добавить логику загрузки расписания для выбранной даты
                },
                onMonthChanged: (newMonth) {
                  setState(() {
                    _currentMonth = newMonth;
                    // Если выбранная дата не в новом месяце, выбираем первый день месяца
                    if (_selectedDate.month != newMonth.month || _selectedDate.year != newMonth.year) {
                      _selectedDate = DateTime(newMonth.year, newMonth.month, 1);
                    }
                  });
                  // Здесь можно добавить логику загрузки расписания для нового месяца
                },
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: scheduleList.length,
            itemBuilder: (context, index) {
              return ScheduleCard(item: scheduleList[index]);
            },
          ),
        ),
      ],
    );
  }

  String _formatSelectedDate(DateTime date) {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));
    
    if (_isSameDay(date, today)) {
      return 'Сегодня';
    } else if (_isSameDay(date, yesterday)) {
      return 'Вчера';
    } else if (_isSameDay(date, tomorrow)) {
      return 'Завтра';
    } else {
      final months = [
        'января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
        'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'
      ];
      return '${date.day} ${months[date.month - 1]}';
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && 
           date1.month == date2.month && 
           date1.day == date2.day;
  }
} 
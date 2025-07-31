import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Function(DateTime)? onMonthChanged;

  const HorizontalCalendar({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.onMonthChanged,
  });

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  late DateTime _selectedDate;
  late DateTime _displayMonth; // Добавляем переменную для отображаемого месяца
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
    _displayMonth = DateTime(widget.selectedDate.year, widget.selectedDate.month, 1); // Инициализируем отображаемый месяц
    _scrollController = ScrollController();

    // Прокручиваем к выбранной дате
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedDate();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedDate() {
    final selectedDay = _selectedDate.day;
    final itemWidth = 78.0; // Ширина одного элемента календаря (70 + 8 margin)
    final offset = (selectedDay - 1) * itemWidth;

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now();
    final currentMonth = DateTime(_displayMonth.year, _displayMonth.month, 1);
    final daysInMonth =
        DateTime(_displayMonth.year, _displayMonth.month + 1, 0).day;
    final firstWeekday = currentMonth.weekday;

    return Column(
      children: [
        // Заголовок с названием месяца и кнопками
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
                             // Кнопка предыдущий месяц
               IconButton(
                 onPressed: () {
                   final prevMonth = DateTime(
                     _displayMonth.year,
                     _displayMonth.month - 1,
                     1,
                   );
                   setState(() {
                     _displayMonth = prevMonth;
                   });
                   widget.onMonthChanged?.call(prevMonth);
                 },
                icon: Icon(
                  Icons.chevron_left,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

                             // Название месяца
               Expanded(
                 child: Center(
                   child: Text(
                     DateFormat('MMMM yyyy', 'ru_RU').format(_displayMonth),
                     style: theme.textTheme.titleMedium?.copyWith(
                       fontWeight: FontWeight.w600,
                       color: const Color(0xFF1E293B), // Темный цвет для лучшей видимости
                     ),
                   ),
                 ),
               ),

                             // Кнопка следующий месяц
               IconButton(
                 onPressed: () {
                   final nextMonth = DateTime(
                     _displayMonth.year,
                     _displayMonth.month + 1,
                     1,
                   );
                   setState(() {
                     _displayMonth = nextMonth;
                   });
                   widget.onMonthChanged?.call(nextMonth);
                 },
                icon: Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),

                 // Календарь
         Container(
           height: 80, // Уменьшена высота с 100 до 80
           margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: daysInMonth,
                         itemBuilder: (context, index) {
               final date = DateTime(
                 _displayMonth.year,
                 _displayMonth.month,
                 index + 1,
               );
              final isSelected = _isSameDay(date, _selectedDate);
              final isToday = _isSameDay(date, today);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                  widget.onDateSelected(date);
                },
                                 child: Container(
                   width: 70, // Уменьшена ширина с 80 до 70
                   margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? theme.colorScheme.primary
                            : isToday
                            ? const Color(0xFF10B981) // Зеленый для сегодня
                            : theme.colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          isSelected
                              ? theme.colorScheme.primary
                              : isToday
                              ? const Color(0xFF10B981)
                              : theme.colorScheme.outline.withOpacity(0.3),
                      width: isToday ? 2 : 1, // Толще рамка для сегодня
                    ),
                    boxShadow:
                        isToday
                            ? [
                              BoxShadow(
                                color: const Color(0xFF10B981).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                                             // День недели
                       Text(
                         DateFormat(
                           'E',
                           'ru_RU',
                         ).format(date).substring(0, 2).toUpperCase(),
                         style: TextStyle(
                           color:
                               isSelected
                                   ? Colors.white
                                   : isToday
                                   ? Colors.white
                                   : theme.colorScheme.onSurfaceVariant,
                           fontSize: 10, // Уменьшен размер с 12 до 10
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                       const SizedBox(height: 2), // Уменьшен отступ с 4 до 2
                       // Число
                       Text(
                         date.day.toString(),
                         style: TextStyle(
                           color:
                               isSelected
                                   ? Colors.white
                                   : isToday
                                   ? Colors.white
                                   : theme.colorScheme.onSurface,
                           fontSize: 16, // Уменьшен размер с 20 до 16
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

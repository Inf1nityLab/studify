import 'package:flutter/material.dart';
import '../../domain/schedule_item.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleItem item;
  const ScheduleCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          // Левая часть с временем и точками
          SizedBox(
            width: 60,
            child: Column(
              children: [
                // Время урока (вертикально)
                Column(
                  children: [
                    Text(
                      _formatTime(item.startTime),
                      style: const TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatTime(item.endTime),
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Аватар с иконкой статуса
                CircleAvatar(
                  radius: 15,
                  backgroundColor: _getStatusColor(),
                  child: _getStatusIcon(),
                ),
                const SizedBox(height: 8),
                // Точки в цикле
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(8, (index) => Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3B82F6),
                        shape: BoxShape.circle,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 8),
          
          // Карточка
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Заголовок с группой и временем
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Группа',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item.groupName,
                          style: const TextStyle(
                            color: Color(0xFF1E293B),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        // Круглый прогресс вместо времени
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  value: _getProgressValue(),
                                  strokeWidth: 8,
                                  backgroundColor: const Color(0xFFE2E8F0),
                                  valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor()),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${(_getProgressValue() * 100).toInt()}%',
                                  style: TextStyle(
                                    color: _getProgressColor(),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Предмет
                    Text(
                      item.subjectName,
                      style: const TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Учитель, статус и прогресс в одной строке
                  Row(
                    children: [
                      // Учитель
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              size: 16,
                              color: Color(0xFF64748B),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                item.teacherName,
                                style: const TextStyle(
                                  color: Color(0xFF64748B),
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      

                      
                                            // Онлайн статус или кабинет
                      if (_isOnline()) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xFF10B981),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.wifi,
                                size: 10,
                                color: Color(0xFF10B981),
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                'Онлайн',
                                style: TextStyle(
                                  color: Color(0xFF10B981),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xFF3B82F6),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.room,
                                size: 10,
                                color: Color(0xFF3B82F6),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Каб. ${_getRoomNumber()}',
                                style: const TextStyle(
                                  color: Color(0xFF3B82F6),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      

                    ],
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    // Для демонстрации дизайна используем разные цвета для разных карточек
    final index = item.hashCode % 5;
    
    switch (index) {
      case 0:
        return const Color(0xFF10B981); // Зеленый - идет сейчас
      case 1:
        return const Color(0xFF3B82F6); // Синий - будет
      case 2:
        return const Color(0xFF6B7280); // Серый - завершено
      case 3:
        return const Color(0xFFEF4444); // Красный - отменено
      case 4:
        return const Color(0xFFF59E0B); // Оранжевый - перенесено
      default:
        return const Color(0xFF3B82F6); // Синий - по умолчанию
    }
  }

  Widget _getStatusIcon() {
    // Для демонстрации дизайна используем разные иконки для разных карточек
    final index = item.hashCode % 5;
    
    switch (index) {
      case 0:
        return const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 20,
        );
      case 1:
        return const Icon(
          Icons.schedule,
          color: Colors.white,
          size: 18,
        );
      case 2:
        return const Icon(
          Icons.check,
          color: Colors.white,
          size: 18,
        );
      case 3:
        return const Icon(
          Icons.close,
          color: Colors.white,
          size: 18,
        );
      case 4:
        return const Icon(
          Icons.swap_horiz,
          color: Colors.white,
          size: 18,
        );
      default:
        return const Icon(
          Icons.schedule,
          color: Colors.white,
          size: 18,
        );
    }
  }

  bool _isOnline() {
    // Для демонстрации дизайна - чередуем онлайн/офлайн
    return item.hashCode % 2 == 0;
  }

  String _getRoomNumber() {
    // Для демонстрации дизайна - разные кабинеты
    final rooms = ['101', '205', '312', '401', '503'];
    return rooms[item.hashCode % rooms.length];
  }

  double _getProgressValue() {
    // Для демонстрации дизайна - разные значения прогресса
    final progressValues = [0.0, 0.25, 0.5, 0.75, 1.0];
    return progressValues[item.hashCode % progressValues.length];
  }

  Color _getProgressColor() {
    final progress = _getProgressValue();
    if (progress == 0.0) {
      return const Color(0xFF6B7280); // Серый - не начался
    } else if (progress < 1.0) {
      return const Color(0xFF3B82F6); // Синий - в процессе
    } else {
      return const Color(0xFF10B981); // Зеленый - завершен
    }
  }

  String _getProgressText() {
    final progress = _getProgressValue();
    if (progress == 0.0) {
      return 'Урок не начался';
    } else if (progress < 1.0) {
      return 'Урок в процессе';
    } else {
      return 'Урок завершен';
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

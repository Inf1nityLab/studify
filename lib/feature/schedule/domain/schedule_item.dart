class ScheduleItem {
  final String groupName;
  final String subjectName;
  final String teacherName;
  final DateTime startTime;
  final DateTime endTime;

  const ScheduleItem({
    required this.groupName,
    required this.subjectName,
    required this.teacherName,
    required this.startTime,
    required this.endTime,
  });
} 
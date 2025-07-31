import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import 'mobile/schedule_mobile_screen.dart';
import 'desktop/schedule_desktop_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ScheduleMobileScreen(),
      desktop: ScheduleDesktopScreen(),
    );
  }
} 
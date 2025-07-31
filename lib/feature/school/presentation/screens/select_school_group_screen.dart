import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import 'mobile/select_school_group_mobile_screen.dart';
import 'desktop/select_school_group_desktop_screen.dart';
import '../widgets/select_school_group_controller.dart';

class SelectSchoolGroupScreen extends StatefulWidget {
  const SelectSchoolGroupScreen({super.key});

  @override
  State<SelectSchoolGroupScreen> createState() => _SelectSchoolGroupScreenState();
}

class _SelectSchoolGroupScreenState extends State<SelectSchoolGroupScreen> {
  late final SelectSchoolGroupController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SelectSchoolGroupController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SelectSchoolGroupMobileScreen(controller: _controller),
      desktop: SelectSchoolGroupDesktopScreen(controller: _controller),
    );
  }
} 
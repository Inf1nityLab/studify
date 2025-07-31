import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import 'mobile/create_school_mobile_screen.dart';
import 'desktop/create_school_desktop_screen.dart';
import '../widgets/create_school_controller.dart';

class CreateSchoolScreen extends StatefulWidget {
  const CreateSchoolScreen({super.key});

  @override
  State<CreateSchoolScreen> createState() => _CreateSchoolScreenState();
}

class _CreateSchoolScreenState extends State<CreateSchoolScreen> {
  late final CreateSchoolController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CreateSchoolController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: CreateSchoolMobileScreen(controller: _controller),
      desktop: CreateSchoolDesktopScreen(controller: _controller),
    );
  }
}

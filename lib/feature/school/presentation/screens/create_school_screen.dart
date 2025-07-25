import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive_layout.dart';
import 'mobile/create_school_mobile_screen.dart';
import 'desktop/create_school_desktop_screen.dart';

class CreateSchoolScreen extends StatefulWidget {
  const CreateSchoolScreen({super.key});

  @override
  State<CreateSchoolScreen> createState() => _CreateSchoolScreenState();
}

class _CreateSchoolScreenState extends State<CreateSchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const CreateSchoolMobileScreen(),
      desktop: const CreateSchoolDesktopScreen(),
    );
  }
} 
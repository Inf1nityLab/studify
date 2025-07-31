import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/responsive_layout.dart';

import 'mobile/navigation_mobile_screen.dart';
import 'desktop/navigation_desktop_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: NavigationMobileScreen(),
      desktop: NavigationDesktopScreen(),
    );
  }
}

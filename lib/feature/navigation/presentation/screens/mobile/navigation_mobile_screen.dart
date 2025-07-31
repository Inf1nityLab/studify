import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';
import '../../providers/navigation_provider.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../widgets/page_content.dart';

class NavigationMobileScreen extends StatefulWidget {
  const NavigationMobileScreen({super.key});

  @override
  State<NavigationMobileScreen> createState() => _NavigationMobileScreenState();
}

class _NavigationMobileScreenState extends State<NavigationMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        final hasFloatingActionButton = navigationProvider.hasFloatingActionButton;

        return Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: SafeArea(child: PageContent()),
          floatingActionButton: hasFloatingActionButton ? FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              final fabIdx = navigationProvider.fabIndex;
              if (fabIdx != null) {
                navigationProvider.setCurrentIndex(fabIdx);
              }
            },
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            elevation: 8,
            child: Icon(
              navigationProvider.fabIndex != null 
                ? navigationProvider.getNavigationItems(context)[navigationProvider.fabIndex!].icon
                : Icons.add,
              size: 28,
            ),
          ) : CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: navigationProvider.getBottomNavigationItems(context).length,
            tabBuilder: (int index, bool isActive) {
              final item = navigationProvider.getBottomNavigationItems(context)[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8),
                  Icon(
                    item.icon,
                    size: 24,
                    color: isActive ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 10,
                      color: isActive ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              );
            },
            activeIndex: navigationProvider.bottomNavigationActiveIndex,
            gapLocation: navigationProvider.hasFloatingActionButton ? GapLocation.center : GapLocation.none,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            backgroundColor: theme.colorScheme.surfaceVariant,
            elevation: 8,
            shadow: BoxShadow(
              color: theme.colorScheme.shadow.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
            onTap: (index) {
              final navigationIndex = navigationProvider.getNavigationIndexFromBottomNav(index);
              navigationProvider.setCurrentIndex(navigationIndex);
            },
          ),
        );
      },
    );
  }
} 
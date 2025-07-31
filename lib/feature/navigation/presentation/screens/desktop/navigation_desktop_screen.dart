import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/navigation_provider.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../widgets/page_content.dart';

class NavigationDesktopScreen extends StatefulWidget {
  const NavigationDesktopScreen({super.key});

  @override
  State<NavigationDesktopScreen> createState() =>
      _NavigationDesktopScreenState();
}

class _NavigationDesktopScreenState extends State<NavigationDesktopScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _widthAnimation = Tween<double>(begin: 60.0, end: 200.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    
    // Инициализируем анимацию на основе состояния из NavigationProvider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
      if (navigationProvider.isSidebarExpanded) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSidebar() {
    final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
    final isExpanded = navigationProvider.isSidebarExpanded;
    
    if (isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    
    navigationProvider.toggleSidebar();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        final isExpanded = navigationProvider.isSidebarExpanded;
        
        return Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: Row(
            children: [
              // Sidebar с отступами
              Container(
                margin: EdgeInsets.all(12),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      width: _widthAnimation.value,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.shadow.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [

                          Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        theme.colorScheme.primary,
                                        theme.colorScheme.primary.withOpacity(0.8),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.school,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                if (isExpanded) ...[
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: AnimatedOpacity(
                                      opacity: _opacityAnimation.value,
                                      duration: Duration(milliseconds: 200),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Studify',
                                            style: TextStyle(
                                              color:
                                                  theme.colorScheme.onSurface,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            l10n.educationFuture,
                                            style: TextStyle(
                                              color: theme.colorScheme.onSurface
                                                  .withOpacity(0.7),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          
                          Divider(
                            color: theme.colorScheme.outline.withOpacity(0.1),
                            height: 1,
                          ),
                          
                          // Navigation Items
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              itemCount: navigationProvider.getNavigationItems(context).length,
                              itemBuilder: (context, index) {
                                final item = navigationProvider.getNavigationItems(context)[index];
                                final isSelected = navigationProvider.currentIndex == index;

                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? theme.colorScheme.primary.withOpacity(0.1)
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        isSelected
                                            ? Border.all(
                                                color: theme.colorScheme.primary.withOpacity(
                                                  0.3,
                                                ),
                                                width: 1,
                                              )
                                            : null,
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      navigationProvider.setCurrentIndex(index);
                                    },
                                    dense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    leading: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? theme.colorScheme.primary
                                                : theme
                                                    .colorScheme
                                                    .surfaceVariant,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Icon(
                                        item.icon,
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : theme
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                        size: 16,
                                      ),
                                    ),
                                    title:
                                        isExpanded
                                            ? AnimatedOpacity(
                                                opacity: _opacityAnimation.value,
                                                duration: Duration(
                                                  milliseconds: 200,
                                                ),
                                                child: Text(
                                                  item.label,
                                                  style: TextStyle(
                                                    color:
                                                        isSelected
                                                            ? theme.colorScheme.primary
                                                            : theme
                                                                .colorScheme
                                                                .onSurface,
                                                    fontWeight:
                                                        isSelected
                                                            ? FontWeight.w600
                                                            : FontWeight.normal,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            : null,
                                    trailing:
                                        isSelected && isExpanded
                                            ? AnimatedOpacity(
                                                opacity: _opacityAnimation.value,
                                                duration: Duration(
                                                  milliseconds: 200,
                                                ),
                                                child: Container(
                                                  width: 3,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                    color: theme.colorScheme.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(2),
                                                  ),
                                                ),
                                              )
                                            : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          
                          // Кнопка сворачивания
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                if (isExpanded) ...[
                                  Expanded(
                                    child: Text(
                                      isExpanded ? l10n.sidebarCollapse : l10n.sidebarExpand,
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                ],
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.surfaceVariant,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: IconButton(
                                    onPressed: _toggleSidebar,
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(
                                      minWidth: 24,
                                      minHeight: 24,
                                    ),
                                    icon: AnimatedRotation(
                                      turns: isExpanded ? 0.5 : 0.0,
                                      duration: Duration(milliseconds: 300),
                                      child: Icon(
                                        Icons.chevron_left,
                                        color:
                                            theme.colorScheme.onSurfaceVariant,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          Divider(
                            color: theme.colorScheme.outline.withOpacity(0.1),
                            height: 1,
                          ),
                          
                          // Footer с выходом
                          Container(
                            padding: EdgeInsets.all(12),
                            child:
                                isExpanded
                                    ? AnimatedOpacity(
                                        opacity: _opacityAnimation.value,
                                        duration: Duration(milliseconds: 200),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                color:
                                                    theme
                                                        .colorScheme
                                                        .surfaceVariant,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Icon(
                                                Icons.logout,
                                                color:
                                                    theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                size: 14,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                l10n.logout,
                                                style: TextStyle(
                                                  color:
                                                      theme.colorScheme.onSurface,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color:
                                              theme
                                                  .colorScheme
                                                  .surfaceVariant,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Icon(
                                          Icons.logout,
                                          color:
                                              theme.colorScheme.onSurfaceVariant,
                                          size: 14,
                                        ),
                                      ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              // Main Content - занимает все пространство
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 12, right: 12, bottom: 12),
                  child: PageContent(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class LogoPicker extends StatelessWidget {
  final String? selectedLogo;
  final Function(String) onLogoSelected;

  const LogoPicker({
    super.key,
    this.selectedLogo,
    required this.onLogoSelected,
  });

    @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () => _showLogoPicker(context),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surface,
          border: Border.all(color: theme.colorScheme.outline, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child:
            selectedLogo != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(selectedLogo!, fit: BoxFit.cover),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 40,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context).logo,
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  void _showLogoPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _LogoPickerBottomSheet(
        selectedLogo: selectedLogo,
        onLogoSelected: onLogoSelected,
      ),
    );
  }
}

class _LogoPickerBottomSheet extends StatelessWidget {
  final String? selectedLogo;
  final Function(String) onLogoSelected;

  const _LogoPickerBottomSheet({
    required this.selectedLogo,
    required this.onLogoSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Список доступных логотипов (в реальном приложении это будут пути к изображениям)
    final logos = [
      'assets/logos/school1.png',
      'assets/logos/school2.png',
      'assets/logos/school3.png',
      'assets/logos/school4.png',
      'assets/logos/school5.png',
      'assets/logos/school6.png',
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Заголовок
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: theme.colorScheme.outline, width: 1),
              ),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context).selectLogo,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    AppLocalizations.of(context).cancel,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Сетка логотипов
          Container(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: logos.length,
              itemBuilder: (context, index) {
                final logo = logos[index];
                final isSelected = selectedLogo == logo;

                return GestureDetector(
                  onTap: () {
                    onLogoSelected(logo);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outline,
                        width: isSelected ? 3 : 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: theme.colorScheme.background,
                        child: Center(
                          child: Icon(
                            Icons.school,
                            size: 32,
                            color:
                                isSelected
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onSurface.withOpacity(
                                      0.6,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Кнопка загрузки
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Логика загрузки изображения
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.upload),
                label: Text(AppLocalizations.of(context).uploadImage),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

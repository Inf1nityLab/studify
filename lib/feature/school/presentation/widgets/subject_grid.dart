import 'package:flutter/material.dart';

class SubjectGrid extends StatelessWidget {
  final List<String> subjects;
  final List<String> selected;
  final void Function(String) onSelect;
  const SubjectGrid({super.key, required this.subjects, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.8,
      ),
      itemCount: subjects.length,
      itemBuilder: (context, i) {
        final s = subjects[i];
        final isSelected = selected.contains(s);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isSelected ? theme.colorScheme.primary.withOpacity(0.13) : theme.colorScheme.surface,
            border: Border.all(
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline.withOpacity(0.3),
              width: isSelected ? 2.2 : 1.2,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.10),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => onSelect(s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book_rounded, color: isSelected ? theme.colorScheme.primary : theme.iconTheme.color, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    s,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: Icon(Icons.check_circle, color: theme.colorScheme.primary, size: 22),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 
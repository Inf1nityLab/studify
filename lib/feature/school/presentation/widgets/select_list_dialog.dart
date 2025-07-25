import 'package:flutter/material.dart';

class SelectListDialog extends StatefulWidget {
  final List<String> allItems;
  final List<String> selected;
  final String title;
  final void Function(List<String>) onDone;
  const SelectListDialog({
    super.key,
    required this.allItems,
    required this.selected,
    required this.title,
    required this.onDone,
  });

  @override
  State<SelectListDialog> createState() => _SelectListDialogState();
}

class _SelectListDialogState extends State<SelectListDialog> {
  late List<String> filtered;
  late List<String> selected;
  String query = '';

  @override
  void initState() {
    super.initState();
    filtered = widget.allItems;
    selected = List.from(widget.selected);
  }

  void _filter(String value) {
    setState(() {
      query = value;
      filtered = widget.allItems
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      child: SizedBox(
        width: 400,
        height: 500,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.title, style: theme.textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Поиск...',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _filter,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, i) {
                  final item = filtered[i];
                  final isChecked = selected.contains(item);
                  return CheckboxListTile(
                    value: isChecked,
                    onChanged: (v) {
                      setState(() {
                        if (v == true) {
                          selected.add(item);
                        } else {
                          selected.remove(item);
                        }
                      });
                    },
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  widget.onDone(selected);
                  Navigator.of(context).pop();
                },
                child: const Text('Готово'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
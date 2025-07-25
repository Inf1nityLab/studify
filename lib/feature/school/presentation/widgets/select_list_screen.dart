import 'package:flutter/material.dart';

class SelectListScreen extends StatefulWidget {
  final List<String> allItems;
  final List<String> selected;
  final String title;
  const SelectListScreen({
    super.key,
    required this.allItems,
    required this.selected,
    required this.title,
  });

  @override
  State<SelectListScreen> createState() => _SelectListScreenState();
}

class _SelectListScreenState extends State<SelectListScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(selected),
            child: const Text('Готово', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Поиск...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filter,
            ),
          ),
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
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(selected),
                child: const Text('Готово'),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
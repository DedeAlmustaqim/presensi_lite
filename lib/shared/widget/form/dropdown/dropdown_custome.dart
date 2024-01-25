import 'package:flutter/material.dart';

class QDropdownFieldCustome extends StatefulWidget {
  final String label;
  final String value;
  final List<Map<String, String>> items;
  final Function(String, String) onChanged;
  final String? Function(String?)? validator;

  QDropdownFieldCustome({
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  @override
  _QDropdownFieldState createState() => _QDropdownFieldState();
}

class _QDropdownFieldState extends State<QDropdownFieldCustome> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: widget.label,
      ),
      value: widget.value,
      onChanged: (value) {
        setState(() {
          widget.onChanged(value ?? "", _getLabel(value));
        });
      },
      validator: widget.validator,
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item['value'] ?? "",
          child: Text(item['label'] ?? ""),
        );
      }).toList(),
    );
  }

  String _getLabel(String? value) {
    if (value == null) return "";

    for (var item in widget.items) {
      if (item['value'] == value) {
        return item['label'] ?? "";
      }
    }

    return "";
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NIKTextField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(labelText: 'NIK'),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        NIKInputFormatter(),
      ],
    );
  }
}

class NIKInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var text = newValue.text.replaceAll(RegExp(r'\D'), '');
    var newText = '';

    for (int i = 0; i < text.length; i += 4) {
      if (i > 0) newText += ' ';
      newText += text.substring(i, i + 4);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

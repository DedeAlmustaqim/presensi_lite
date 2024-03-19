import 'package:atei_bartim/core.dart';
import 'package:flutter/material.dart';

Future showCustomDialog({
  required String title,
  required List<Widget> children,
  Color? titleColor,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: titleColor ?? textColor1),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ...children,
            ],
          ),
        ),
      );
    },
  );
}

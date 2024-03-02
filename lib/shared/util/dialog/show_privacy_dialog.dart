import 'package:atei_bartim/shared/util/dialog/privacy_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPrivacyDialog({
  required String message,
  required String title,
  Icon? icon,
  bool isIcon = true,
  bool isChecked = false,
  required BuildContext context,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return PrivacyDialog(isChecked: isChecked);
    },
  );
}

import 'package:atei_bartim/core.dart';
import 'package:flutter/material.dart';
import 'package:logo_n_spinner/logo_n_spinner.dart';

showSpin({
  String? message,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return LogoandSpinner(
        imageAssets: 'assets/icon/icon_reverse.png',
        reverse: true,
        arcColor: Colors.white,
        spinSpeed: Duration(milliseconds: 600),
      );
    },
  );
}

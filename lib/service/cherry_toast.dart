import 'package:atei_bartim/shared/theme/theme_config.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class NotifCherryToast {
  late final Position toastPosition;
  late final AnimationType animationType;

  toastError(String? message, BuildContext context) {
    CherryToast.error(
            actionHandler: () {},
            disableToastAnimation: false,
            animationType: AnimationType.fromBottom,
            toastPosition: Position.bottom,
            toastDuration: Duration(seconds: 3),
            title: Text(message.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(color: textColor1, fontSize: 12)))
        .show(context);
  }

  toastInfo(String? message, BuildContext context) {
    CherryToast.info(
            actionHandler: () {},
            disableToastAnimation: false,
            animationType: AnimationType.fromBottom,
            toastPosition: Position.bottom,
            toastDuration: Duration(seconds: 3),
            title: Text(message.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(color: textColor1, fontSize: 12)))
        .show(context);
  }

  toastWarning(String? message, BuildContext context) {
    CherryToast.warning(
            actionHandler: () {},
            disableToastAnimation: false,
            animationType: AnimationType.fromBottom,
            toastPosition: Position.bottom,
            toastDuration: Duration(seconds: 3),
            title: Text(message.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(color: textColor1, fontSize: 12)))
        .show(context);
  }

  toastSuccess(String? message, BuildContext context) {
    CherryToast.success(
            actionHandler: () {},
            disableToastAnimation: false,
            animationType: AnimationType.fromBottom,
            toastPosition: Position.bottom,
            toastDuration: Duration(seconds: 3),
            title: Text(message.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(color: textColor1, fontSize: 12)))
        .show(context);
  }
}

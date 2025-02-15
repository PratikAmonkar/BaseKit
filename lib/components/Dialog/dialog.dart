import 'package:flutter/material.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required Widget child,
  bool shouldDismiss = true,
  bool useSafeArea = false,
  Widget? header,
  List<Widget>? action,
  Color containerBgColor = Colors.white,
  double containerBorderRadius = 20.0,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: shouldDismiss,
    useSafeArea: useSafeArea,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        backgroundColor: containerBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(containerBorderRadius),
          ),
        ),
        title: header,
        content: child,
        actions: action,
      );
    },
  );
}

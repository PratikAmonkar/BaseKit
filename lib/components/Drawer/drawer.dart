import 'package:flutter/material.dart';

Widget navigationDrawer({
  Widget? header,
  Widget? body,
  Widget? footer,
  Color backgroundColor = Colors.white,
  double? borderRadius,
}) {
  return Drawer(
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius != null
          ? BorderRadius.circular(borderRadius)
          : BorderRadius.zero,
    ),
    child: Column(
      children: [
        header ?? Container(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: body ?? Container(),
          ),
        ),
        footer ?? Container(),
        const SizedBox(
          height: 10.0,
        )
      ],
    ),
  );
}

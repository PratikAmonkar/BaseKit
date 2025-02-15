import 'package:flutter/material.dart';

import 'time_picker.dart';

Widget containerWithTimePicker({
  required String value,
  required BuildContext context,
  double containerWidth = 200.0,
  EdgeInsets containerPadding =
      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
  Color borderColor = Colors.grey,
  double borderRadius = 10.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.black,
  IconData icon = Icons.calendar_month,
  double iconSize = 20.0,
  Color iconColor = Colors.black,
  bool showDialog = false,
  required Function(TimeOfDay) onTapAction,
}) {
  return Container(
    width: containerWidth,
    padding: containerPadding,
    decoration: BoxDecoration(
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value.isEmpty ? "-" : value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (showDialog) {
              await displayTimePicker(
                context: context,
                onTapAction: (value) {
                  onTapAction(value);
                },
              );
            }
          },
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ],
    ),
  );
}

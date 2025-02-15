import 'package:flutter/material.dart';

import 'date_picker.dart';

Widget containerWithDatePicker({
  required String value,
  required BuildContext context,
  double containerWidth = 200.0,
  String placeHolder = "DD/MM/YYYY",
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
  required Function(DateTime?) onTapAction,
}) {
  return GestureDetector(
    onTap: () async {
      DateTime? selectedDate = await displayDatePicker(context: context);
      onTapAction(selectedDate);
      // onTapAction(
      //
      // );
    },
    child: Container(
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
            value.isEmpty ? placeHolder : value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: value.isEmpty ? Colors.grey : fontColor,
            ),
          ),
          Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Widget checkBox({
  required bool isChecked,
  required Function onTapAction,
  double borderRadius = 2.0,
  Color checkColor = Colors.white,
  double borderWidth = 2.0,
  Color borderColor = Colors.black,
  Color activeColor = Colors.black,
  bool isEnable = true,
}) {
  return Checkbox(
    value: isChecked,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    ),
    checkColor: checkColor,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    side: BorderSide(width: borderWidth, color: borderColor),
    activeColor: isEnable ? activeColor : Colors.grey,
    onChanged: (value) {
      onTapAction();
    },
  );
}

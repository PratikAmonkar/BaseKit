import 'package:flutter/material.dart';

Widget circularPercentIndicator({
  required String title,
  required double value,
  required double extraValue,
  required Color indicatorColor,
  required Color extraIndicatorColor,
  String subTitle = "",
  double containerHeight = 200.0,
  double containerWidth = 200.0,
  Color nonIndicatorColor = Colors.grey,
  double strokeWidth = 22.0,
  double extraStrokeWidth = 18.0,
  StrokeCap strokeCap = StrokeCap.round,
  double fontSize = 20.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.black,
  EdgeInsets containerMargin =
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  required Function onTapAction,
}) {
  return GestureDetector(
    onTap: () {
      onTapAction();
    },
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: containerMargin,
          height: containerHeight,
          width: containerWidth,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: strokeWidth,
            strokeCap: strokeCap,
            backgroundColor: nonIndicatorColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              indicatorColor,
            ),
          ),
        ),
        if (extraValue > 0)
          Container(
            margin: containerMargin,
            height: containerHeight,
            width: containerWidth,
            child: CircularProgressIndicator(
              value: extraValue,
              strokeWidth: extraStrokeWidth,
              strokeCap: strokeCap,
              backgroundColor: Colors.transparent,
              // No background color
              valueColor: AlwaysStoppedAnimation<Color>(
                extraIndicatorColor,
              ),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: fontColor,
              ),
            ),
            if (subTitle.isNotEmpty)
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              )
          ],
        ),
      ],
    ),
  );
}

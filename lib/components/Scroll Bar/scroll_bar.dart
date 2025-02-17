import 'package:flutter/material.dart';

Widget scrollBar({
  required ScrollController controller,
  required Widget child,
  Color thumbColor = Colors.orange,
  Color trackColor = Colors.grey,
  double verticalMargin = 1.0,
  bool isTrackVisible = true,
  double thumbThickness = 10.0,
  bool isThumbVisible = true,
  double horizontalMargin = 1.0,
  double thumbBorderRadius = 10.0,
  double trackBorderRadius = 10.0,
  Color trackBorderColor = Colors.transparent,
  EdgeInsets padding = const EdgeInsets.all(10.0),
}) {
  return RawScrollbar(
    controller: controller,
    thumbColor: thumbColor,
    crossAxisMargin: verticalMargin,
    trackColor: trackColor,
    trackVisibility: isTrackVisible,
    thickness: thumbThickness,
    thumbVisibility: isThumbVisible,
    interactive: true,
    mainAxisMargin: horizontalMargin,
    radius: Radius.circular(thumbBorderRadius),
    trackRadius: Radius.circular(trackBorderRadius),
    trackBorderColor: trackBorderColor,
    padding: padding,
    child: child,
  );
}

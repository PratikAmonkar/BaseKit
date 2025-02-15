import 'package:flutter/material.dart';

enum DeviceCategory { small, medium, large, tablet }

class DeviceInfoHelper {
  static DeviceInfo getDeviceInfo(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final DeviceCategory category = _getDeviceCategory(screenWidth);

    return DeviceInfo(
      category: category,
      orientation: orientation,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
    );
  }

  static DeviceCategory _getDeviceCategory(double width) {
    if (width <= 600) {
      return DeviceCategory.small;
    } else if (width <= 800) {
      return DeviceCategory.medium;
    } else if (width <= 1200) {
      return DeviceCategory.large;
    } else {
      return DeviceCategory.tablet;
    }
  }
}

class DeviceInfo {
  final DeviceCategory category;
  final Orientation orientation;
  final double screenWidth;
  final double screenHeight;

  DeviceInfo({
    required this.category,
    required this.orientation,
    required this.screenWidth,
    required this.screenHeight,
  });
}

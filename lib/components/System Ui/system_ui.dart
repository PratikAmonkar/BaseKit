import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void systemUiConfig({
  Color statusBarColor = Colors.white,
  Color navigationColor = Colors.white,
  Brightness statusBarIcon = Brightness.dark,
  Brightness navigationBarIcon = Brightness.dark,
}) {
  return SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: statusBarIcon,
      systemNavigationBarColor: navigationColor,
      systemNavigationBarIconBrightness: navigationBarIcon,
    ),
  );
}

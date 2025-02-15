import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// TODO:: add lottie dependency in pubspec.yaml file compatible version : [lottie: ^3.1.3]

Widget lottieLoader({
  double width = 100.0,
  double height = 100.0,
  BoxFit boxFit = BoxFit.fill,
  required String imagePath,
}) {
  return Container(
    color: Colors.white,
    child: Center(
      child: Lottie.asset(
        'assets/$imagePath',
        width: width,
        height: height,
        fit: boxFit,
      ),
    ),
  );
}

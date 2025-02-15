import 'dart:ui';

import 'package:flutter/material.dart';

Widget textButton({
  required String text,
  Function? onPressed,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double height = 50.0,
  double elevation = 0.0,
  Color backgroundColor = Colors.white,
  Color disableBackgroundColor = Colors.grey,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.black,
  Color shadowColor = Colors.transparent,
  Color borderColor = Colors.black,
  double borderWidth = 2.0,
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ).copyWith(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed != null ? () => onPressed() : null,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    ),
  );
}

Widget outlinedButton({
  required String text,
  Function? onPressed,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double height = 50.0,
  double elevation = 0.0,
  Color backgroundColor = Colors.white,
  Color disableBackgroundColor = Colors.grey,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.black,
  Color shadowColor = Colors.transparent,
  Color borderColor = Colors.black,
  double borderWidth = 2.0,
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableBackgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          width: borderWidth,
          color: borderColor,
          // style: BorderStyle.,
          // strokeAlign: 10.0,
        ),
        shadowColor: shadowColor,
      ).copyWith(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed != null ? () => onPressed() : null,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    ),
  );
}

Widget button({
  required String text,
  Function? onPressed,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double? height,
  double elevation = 0.0,
  Color backgroundColor = Colors.black,
  Color disableBackgroundColor = Colors.grey,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.white,
  Color shadowColor = Colors.transparent,
  EdgeInsets innerPadding =
      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableBackgroundColor,
        enableFeedback: false,
        elevation: elevation,
        padding: innerPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide.none,
        ),
        shadowColor: shadowColor,
      ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed != null
          ? () {
              onPressed();
            }
          : null,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    ),
  );
}

Widget gradientButton({
  required String text,
  Function? onPressed,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double? height,
  double elevation = 0.0,
  Color disableBackgroundColor = Colors.grey,
  Gradient? gradientColors,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.white,
  Color shadowColor = Colors.transparent,
  EdgeInsets innerPadding =
      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: disableBackgroundColor,
      gradient: gradientColors,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: FilledButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        enableFeedback: false,
        elevation: elevation,
        padding: innerPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide.none,
        ),
        shadowColor: shadowColor,
      ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed != null
          ? () {
              onPressed();
            }
          : null,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    ),
  );
}

Widget dottedOutlinedBorderButton({
  required String text,
  Function? onPressed,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double height = 50.0,
  double elevation = 0.0,
  Color backgroundColor = Colors.white,
  Color disableBackgroundColor = Colors.grey,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.black,
  Color shadowColor = Colors.transparent,
  Color borderColor = Colors.black,
  double borderHeight = 2.0,
  double borderWidth = 6.0,
  double borderSpace = 3.0,
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    child: CustomPaint(
      painter: DottedBorderPainter(
        cornerRadius: borderRadius,
        borderColor: borderColor,
        borderWidth: borderHeight,
        dashSpace: borderSpace,
        dashWidth: borderWidth,
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disableBackgroundColor,
          enableFeedback: false,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide.none,
          ),
          shadowColor: shadowColor,
        ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: onPressed != null
            ? () {
                onPressed();
              }
            : null,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),
        ),
      ),
    ),
  );
}

Widget buttonWithImage({
  required String text,
  Function? onPressed,
  String? imagePath,
  double imageSize = 20.0,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double height = 50.0,
  double elevation = 0.0,
  Color backgroundColor = Colors.black,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.white,
  double contentGap = 10.0,
  Color disableBackgroundColor = Colors.grey,
  EdgeInsets innerPadding =
      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
  String? prefixImage,
  String? suffixImage,
  Color prefixImageColor = Colors.white,
  Color suffixImageColor = Colors.white,
  Color centerImageColor = Colors.white,
  double suffixImageSize = 18.0,
  double prefixImageSize = 18.0,
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    child: FilledButton(
      onPressed: onPressed != null
          ? () {
              onPressed();
            }
          : null,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixImage != null
              ? Image.asset(
                  prefixImage,
                  height: prefixImageSize,
                  width: prefixImageSize,
                  color: prefixImageColor,
                  colorBlendMode: BlendMode.srcIn,
                )
              : Container(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imagePath != null
                    ? Padding(
                        padding: EdgeInsets.only(right: contentGap),
                        child: Image.asset(
                          imagePath,
                          height: imageSize,
                          width: imageSize,
                          color: centerImageColor,
                          colorBlendMode: BlendMode.srcIn,
                        ),
                      )
                    : Container(),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: fontColor,
                  ),
                ),
              ],
            ),
          ),
          suffixImage != null
              ? Image.asset(
                  suffixImage,
                  height: suffixImageSize,
                  width: suffixImageSize,
                  color: suffixImageColor,
                  colorBlendMode: BlendMode.srcIn,
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget outlinedButtonWithImage({
  required String text,
  Function? onPressed,
  required String imagePath,
  double imageSize = 20.0,
  EdgeInsets margin =
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
  double width = double.infinity,
  double height = 50.0,
  double elevation = 0.0,
  Color backgroundColor = Colors.transparent,
  double borderRadius = 8.0,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.bold,
  Color fontColor = Colors.black,
  double contentGap = 10.0,
  Color disableBackgroundColor = Colors.grey,
  EdgeInsets innerPadding =
      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
  Color borderColor = Colors.black,
  double borderHeight = 2.0,
  double borderWidth = 6.0,
  double borderSpace = 3.0,
}) {
  return Container(
    margin: margin,
    width: width,
    height: height,
    child: CustomPaint(
      painter: DottedBorderPainter(
        cornerRadius: borderRadius,
        borderColor: borderColor,
        borderWidth: borderHeight,
        dashSpace: borderSpace,
        dashWidth: borderWidth,
      ),
      child: FilledButton(
        onPressed: onPressed != null
            ? () {
                onPressed();
              }
            : null,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: imageSize,
              width: imageSize,
            ),
            SizedBox(width: contentGap),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class DottedBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;
  final double dashWidth;
  final double dashSpace;
  final double cornerRadius;

  DottedBorderPainter({
    this.borderColor = Colors.blue,
    this.borderWidth = 4.0,
    this.dashWidth = 6.0,
    this.dashSpace = 3.0,
    this.cornerRadius = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(cornerRadius),
    );

    Path borderPath = Path()..addRRect(rRect);
    PathMetric pathMetric = borderPath.computeMetrics().first;
    Path dashedPath = Path();

    for (double distance = 0;
        distance < pathMetric.length;
        distance += dashWidth + dashSpace) {
      dashedPath.addPath(
        pathMetric.extractPath(distance, distance + dashWidth),
        Offset.zero,
      );
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

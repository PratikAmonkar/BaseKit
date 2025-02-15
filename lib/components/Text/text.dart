import 'package:flutter/material.dart';

// weight: 100
Widget textThin({
  String title = "",
  TextOverflow overFlow = TextOverflow.ellipsis,
  TextAlign textAlign = TextAlign.start,
  bool softWrap = true,
  int maxLine = 1,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return Text(
    title,
    overflow: overFlow,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: maxLine,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w100,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      wordSpacing: wordSpacing,
    ),
  );
}

// weight: 300
Widget textLight({
  String title = "",
  TextOverflow overFlow = TextOverflow.ellipsis,
  TextAlign textAlign = TextAlign.start,
  bool softWrap = true,
  int maxLine = 1,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return Text(
    title,
    overflow: overFlow,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: maxLine,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      wordSpacing: wordSpacing,
    ),
  );
}

// weight: 400
Widget textRegular({
  String title = "",
  TextOverflow overFlow = TextOverflow.ellipsis,
  TextAlign textAlign = TextAlign.start,
  bool softWrap = true,
  int maxLine = 1,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return Text(
    title,
    overflow: overFlow,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: maxLine,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      wordSpacing: wordSpacing,
    ),
  );
}

// weight: 500
Widget textMedium({
  String title = "",
  TextOverflow overFlow = TextOverflow.ellipsis,
  TextAlign textAlign = TextAlign.start,
  bool softWrap = true,
  int maxLine = 1,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return Text(
    title,
    overflow: overFlow,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: maxLine,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      wordSpacing: wordSpacing,
    ),
  );
}

// weight: 700
Widget textBold({
  String title = "",
  TextOverflow overFlow = TextOverflow.ellipsis,
  TextAlign textAlign = TextAlign.start,
  bool softWrap = true,
  int maxLine = 1,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return Text(
    title,
    overflow: overFlow,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: maxLine,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      wordSpacing: wordSpacing,
    ),
  );
}

// weight: 900
Widget textExtraBold({
  String title = "",
  TextOverflow overFlow = TextOverflow.ellipsis,
  TextAlign textAlign = TextAlign.start,
  bool softWrap = true,
  int maxLine = 1,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return Text(
    title,
    overflow: overFlow,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: maxLine,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w900,
      fontSize: fontSize,
      color: fontColor,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      wordSpacing: wordSpacing,
    ),
  );
}

Widget richText({
  required String text,
  required List<InlineSpan> children,
  FontWeight fontWeight = FontWeight.w500,
  double fontSize = 16.0,
  Color fontColor = Colors.black,
  TextDecoration textDecoration = TextDecoration.none,
  TextDecorationStyle textDecorationStyle = TextDecorationStyle.solid,
  double wordSpacing = 0.0,
}) {
  return RichText(
    text: TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: fontColor,
        decoration: textDecoration,
        decorationStyle: textDecorationStyle,
        wordSpacing: wordSpacing,
      ),
      children: children,
    ),
  );
}

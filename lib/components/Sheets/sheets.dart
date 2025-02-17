import 'package:flutter/material.dart';

Future<void> showDraggableBottomSheet({
  required BuildContext context,
  required Widget child,
  bool useSafeArea = false,
  double initialChildSize = 0.4,
  double minChildSize = 0.2,
  double maxChildSize = 0.9,
  Color containerBgColor = Colors.white,
  BorderRadiusGeometry containerBorderRadius = const BorderRadius.vertical(
    top: Radius.circular(20.0),
  ),
  EdgeInsetsGeometry containerPadding = const EdgeInsets.all(16.0),
  EdgeInsetsGeometry containerMargin =
      const EdgeInsets.symmetric(horizontal: 10.0),
  Widget? containerTopContent,
  bool allowPaddingScroll = true,
  int inCurveDuration = 500,
  int outCurveDuration = 500,
  Curve inCurve = Curves.easeIn,
  Curve outCurve = Curves.easeIn,
}) {
  return showModalBottomSheet(
    useSafeArea: useSafeArea,
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    sheetAnimationStyle: AnimationStyle(
      duration: Duration(milliseconds: inCurveDuration),
      curve: inCurve,
      reverseDuration: Duration(milliseconds: outCurveDuration),
      reverseCurve: outCurve,
    ),
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: containerBgColor,
          borderRadius: containerBorderRadius,
        ),
        padding: allowPaddingScroll ? null : containerPadding,
        margin: containerMargin,
        child: ListView(
          padding: allowPaddingScroll ? containerPadding : null,
          controller: controller,
          children: [
            ...[
              if (containerTopContent != null) containerTopContent,
            ],
            child,
          ],
        ),
      ),
    ),
  );
}

Future<void> showBottomModelSheet({
  required BuildContext context,
  required Widget child,
  bool useSafeArea = false,
  Color containerBgColor = Colors.white,
  BorderRadiusGeometry containerBorderRadius = const BorderRadius.vertical(
    top: Radius.circular(20.0),
  ),
  EdgeInsetsGeometry containerPadding = const EdgeInsets.all(16.0),
  EdgeInsetsGeometry containerMargin =
      const EdgeInsets.symmetric(horizontal: 10.0),
  Widget? containerTopContent,
  int inCurveDuration = 500,
  int outCurveDuration = 500,
  Curve inCurve = Curves.easeIn,
  Curve outCurve = Curves.easeIn,
}) {
  return showModalBottomSheet(
    sheetAnimationStyle: AnimationStyle(
      duration: Duration(milliseconds: inCurveDuration),
      curve: inCurve,
      reverseDuration: Duration(milliseconds: outCurveDuration),
      reverseCurve: outCurve,
    ),
    useSafeArea: useSafeArea,
    isScrollControlled: false,
    enableDrag: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      padding: containerPadding,
      margin: containerMargin,
      height: 300.0,
      decoration: BoxDecoration(
        color: containerBgColor,
        borderRadius: containerBorderRadius,
      ),
      child: Column(
        children: [
          ...[
            if (containerTopContent != null) containerTopContent,
          ],
          child,
        ],
      ),
    ),
  );
}

Future<void> showModelSideSheet({
  required BuildContext context,
  required Widget child,
  int transitionDuration = 500,
  bool barrierDismissible = true,
  bool isAlignRightSide = true,
  double? containerWidth,
  Color containerBgColor = Colors.white,
  EdgeInsetsGeometry containerPadding = const EdgeInsets.all(16.0),
  double containerBorderRadius = 20.0,
  bool allowPaddingScroll = true,
}) {
  BorderRadiusGeometry borderRadius = BorderRadius.only(
    topLeft:
        isAlignRightSide ? Radius.circular(containerBorderRadius) : Radius.zero,
    bottomLeft:
        isAlignRightSide ? Radius.circular(containerBorderRadius) : Radius.zero,
    topRight: !isAlignRightSide
        ? Radius.circular(containerBorderRadius)
        : Radius.zero,
    bottomRight: !isAlignRightSide
        ? Radius.circular(containerBorderRadius)
        : Radius.zero,
  );
  return showGeneralDialog(
    barrierLabel: "",
    barrierDismissible: barrierDismissible,
    transitionDuration: Duration(milliseconds: transitionDuration),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment:
            (isAlignRightSide ? Alignment.centerRight : Alignment.centerLeft),
        child: Material(
          color: Colors.transparent,
          borderRadius: borderRadius,
          child: Container(
            decoration: BoxDecoration(
              color: containerBgColor,
              borderRadius: borderRadius,
            ),
            padding: allowPaddingScroll ? null : containerPadding,
            height: double.infinity,
            width: containerWidth ?? MediaQuery.of(context).size.width / 1.8,
            child: SafeArea(
              child: ListView(
                padding: allowPaddingScroll ? containerPadding : null,
                children: [child],
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween(
          begin: Offset((isAlignRightSide ? 1 : -1), 0),
          end: const Offset(0, 0),
        ).animate(animation1),
        child: child,
      );
    },
  );
}

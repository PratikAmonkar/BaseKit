import 'package:flutter/material.dart';

Future<void> showSnackBarMessage(
    {required BuildContext context,
    required String primaryTitle,
    required Function onCloseAction,
    int duration = 2,
    bool showCloseIcon = false,
    Color primaryFontColor = Colors.white,
    double primaryFontSize = 12.0,
    FontWeight primaryFontWeight = FontWeight.w400,
    String? secondaryTitle,
    Color secondaryFontColor = Colors.white,
    double secondaryFontSize = 12.0,
    FontWeight secondaryFontWeight = FontWeight.w400,
    Color? backgroundColor,
    EdgeInsets? contentPadding,
    EdgeInsets? contentMargin,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating,
    double? elevation,
    double borderRadius = 4.0,
    Color closeIconColor = Colors.white,
    bool flag = false,
    VoidCallback? onClose,
    VoidCallback? onAction,
    VoidCallback? onCompleteAction,
    int primaryTextMaxLine = 2,
    int secondaryTextMaxLine = 2}) async {
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  scaffoldMessenger.clearSnackBars();

  final snackBar = SnackBar(
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            primaryTitle,
            maxLines: primaryTextMaxLine,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: primaryFontColor,
              fontSize: primaryFontSize,
              fontWeight: primaryFontWeight,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (secondaryTitle != null) ...[
          Flexible(
            child: Text(
              secondaryTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: secondaryTextMaxLine,
              style: TextStyle(
                color: secondaryFontColor,
                fontSize: secondaryFontSize,
                fontWeight: secondaryFontWeight,
              ),
            ),
          ),
        ],
      ],
    ),
    duration: Duration(seconds: duration),
    showCloseIcon: showCloseIcon,
    backgroundColor: backgroundColor,
    padding: contentPadding,
    margin: contentMargin,
    behavior: snackBarBehavior,
    elevation: elevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    closeIconColor: closeIconColor,
  );

  final controller = scaffoldMessenger.showSnackBar(snackBar);

  final closedReason = await controller.closed;

  if (flag) {
    onCompleteAction?.call();
  } else {
    switch (closedReason) {
      case SnackBarClosedReason.action:
        onAction?.call();
        break;
      case SnackBarClosedReason.timeout:
        onClose?.call();
        break;
      default:
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required Widget child,
  bool shouldDismiss = true,
  bool useSafeArea = false,
  Widget? header,
  List<Widget>? action,
  Color containerBgColor = Colors.white,
  double containerBorderRadius = 20.0,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: shouldDismiss,
    useSafeArea: useSafeArea,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        backgroundColor: containerBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(containerBorderRadius),
          ),
        ),
        title: header,
        content: child,
        actions: action,
      );
    },
  );
}



Future<void> showCustomDialog({
  required BuildContext context,
  required Function onDismissAction,
  required Function onSuccessAction,

  String iconPath = "assets/delete_round_icon.png",
  double iconSize = 30.0,

  required String title,
  double titleFontSize = 14.0,
  Color titleFontColor = Colors.black,
  FontWeight titleFontWeight = FontWeight.w700,

  Color dialogColor = Colors.white,
  double dialogBorderRadius = 10.0,

  Color borderColor = Colors.grey,
  double borderWidth = 1,

  String firstBtnTitle = "No",
  double firstBtnSize = 14.0,
  Color firstBtnColor = Colors.black,
  FontWeight firstBtnFontWeight = FontWeight.w700,

  String secondBtnTitle = "Yes",
  double secondBtnSize = 14.0,
  Color secondBtnColor = Colors.black,
  FontWeight secondBtnFontWeight = FontWeight.w700,

  Color systemUiColor = Colors.white,
}) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: systemUiColor,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: systemUiColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );
          return true;
        },
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: IntrinsicHeight(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 22.0),
                  padding: const EdgeInsets.only(top: 30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: dialogColor,
                    borderRadius: BorderRadius.circular(dialogBorderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontFamily: 'Roboto',
                            fontWeight: titleFontWeight,
                            color: titleFontColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: IntrinsicHeight(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: borderColor,
                                      width: borderWidth,
                                    ),
                                    right: BorderSide(
                                      color: borderColor,
                                      width: borderWidth,
                                    ),
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    SystemChrome.setSystemUIOverlayStyle(
                                      SystemUiOverlayStyle(
                                        statusBarColor: systemUiColor,
                                        statusBarIconBrightness:
                                        Brightness.dark,
                                        systemNavigationBarColor: systemUiColor,
                                        systemNavigationBarIconBrightness:
                                        Brightness.dark,
                                      ),
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                        onDismissAction();
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0.0),
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                    ),
                                    surfaceTintColor: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Text(
                                    title = firstBtnTitle,
                                    style: TextStyle(
                                      fontSize: firstBtnSize,
                                      color: firstBtnColor,
                                      fontFamily: 'Roboto',
                                      fontWeight: firstBtnFontWeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: IntrinsicHeight(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: borderColor,
                                      width: borderWidth,
                                    ),
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    SystemChrome.setSystemUIOverlayStyle(
                                      SystemUiOverlayStyle(
                                        statusBarColor: systemUiColor,
                                        statusBarIconBrightness:
                                        Brightness.dark,
                                        systemNavigationBarColor: systemUiColor,
                                        systemNavigationBarIconBrightness:
                                        Brightness.dark,
                                      ),
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                        onSuccessAction();
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0.0),
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                    ),
                                    surfaceTintColor: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Text(
                                    title = secondBtnTitle,
                                    style: TextStyle(
                                      fontSize: secondBtnSize,
                                      color: secondBtnColor,
                                      fontFamily: 'Roboto',
                                      fontWeight: secondBtnFontWeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.0,
                  child: Image.asset(
                    iconPath,
                    height: iconSize,
                    width: iconSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

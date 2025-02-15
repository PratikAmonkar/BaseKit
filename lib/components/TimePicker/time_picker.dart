import 'package:flutter/material.dart';

Future displayTimePicker({
  required BuildContext context,
  TimePickerEntryMode entryMode = TimePickerEntryMode.dialOnly,
  Color containerColor = const Color(0xFFEFE6F7),
  Color containerBorderColor = Colors.transparent,
  double containerBorderWidth = 1,
  double containerBorderCornerRadius = 20.0,
  Color confirmButtonBackgroundColor = Colors.transparent,
  Color confirmButtonFontColor = Colors.black,
  double confirmButtonFontSize = 16.0,
  FontWeight confirmButtonFontWeight = FontWeight.w800,
  Color cancelButtonBackgroundColor = Colors.transparent,
  Color cancelButtonFontColor = Colors.black,
  double cancelButtonFontSize = 16.0,
  FontWeight cancelButtonFontWeight = FontWeight.w800,
  Color hourMinuteBorderColor = Colors.transparent,
  double hourMinuteBorderWidth = 1.0,
  double hourMinuteBorderCornerRadius = 8.0,
  Color hourMinuteSelectedBgColor = const Color(0xFFCE9BFF),
  Color hourMinuteUnSelectedBgColor = const Color(0xFFEBDDFF),
  Color hourMinuteSelectedFontColor = Colors.black,
  Color hourMinuteUnSelectedFontColor = Colors.black,
  double hourMinuteFontSize = 20.0,
  FontWeight hourMinuteFontWeight = FontWeight.w800,
  Color dayPeriodBorderColor = Colors.transparent,
  double dayPeriodBorderWidth = 1.0,
  double dayPeriodBorderCornerRadius = 8.0,
  Color dayPeriodSelectedBgColor = const Color(0xFFCE9BFF),
  Color dayPeriodUnSelectedBgColor = const Color(0xFFEBDDFF),
  Color dayPeriodSelectedFontColor = Colors.black,
  Color dayPeriodUnSelectedFontColor = Colors.black,
  double dayPeriodFontSize = 12.0,
  FontWeight dayPeriodFontWeight = FontWeight.w800,
  double headFontSize = 12.0,
  FontWeight headFontWeight = FontWeight.bold,
  Color headFontColor = Colors.black,
  Color dialIndicatorColor = const Color(0xFF6F43BE),
  Color dialBackgroundColor = const Color(0xFFE7DFEA),
  Color dialSelectedFontColor = Colors.white,
  Color dialUnSelectedFontColor = Colors.black,
  Color entryModelColor = Colors.black,
  required Function(TimeOfDay) onTapAction,
}) async {
  var time = await showTimePicker(
    context: context,
    initialEntryMode: entryMode,
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: TimePickerThemeData(
            confirmButtonStyle: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                confirmButtonBackgroundColor,
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: confirmButtonFontSize,
                  fontWeight: confirmButtonFontWeight,
                  color: confirmButtonFontColor,
                ),
              ),
            ),
            cancelButtonStyle: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                cancelButtonBackgroundColor,
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: cancelButtonFontSize,
                  fontWeight: cancelButtonFontWeight,
                  color: cancelButtonFontColor,
                ),
              ),
            ),
            backgroundColor: containerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(containerBorderCornerRadius),
              ),
              side: BorderSide(
                color: containerBorderColor,
                width: containerBorderWidth,
              ),
            ),
            hourMinuteShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  hourMinuteBorderCornerRadius,
                ),
              ),
              side: BorderSide(
                color: hourMinuteBorderColor,
                width: hourMinuteBorderWidth,
              ),
            ),
            hourMinuteColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? hourMinuteSelectedBgColor
                  : hourMinuteUnSelectedBgColor,
            ),
            hourMinuteTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? hourMinuteSelectedFontColor
                  : hourMinuteUnSelectedFontColor,
            ),
            hourMinuteTextStyle: TextStyle(
              fontSize: hourMinuteFontSize,
              fontWeight: hourMinuteFontWeight,
            ),
            dayPeriodBorderSide: BorderSide(
              color: dayPeriodBorderColor,
              width: dayPeriodBorderWidth,
            ),
            dayPeriodColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? dayPeriodSelectedBgColor
                  : dayPeriodUnSelectedBgColor,
            ),
            dayPeriodTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? dayPeriodSelectedFontColor
                  : dayPeriodUnSelectedFontColor,
            ),
            dayPeriodShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(dayPeriodBorderCornerRadius),
              ),
              side: BorderSide(
                color: dayPeriodBorderColor,
                width: dayPeriodBorderWidth,
              ),
            ),
            dayPeriodTextStyle: TextStyle(
              fontSize: dayPeriodFontSize,
              fontWeight: dayPeriodFontWeight,
            ),
            dialHandColor: dialIndicatorColor,
            dialBackgroundColor: dialBackgroundColor,
            dialTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? dialSelectedFontColor
                  : dialUnSelectedFontColor,
            ),
            helpTextStyle: TextStyle(
              fontSize: headFontSize,
              fontWeight: headFontWeight,
              color: headFontColor,
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.selected)
                    ? hourMinuteSelectedBgColor
                    : hourMinuteUnSelectedBgColor,
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    hourMinuteBorderCornerRadius,
                  ),
                ),
                borderSide: BorderSide(
                  color: hourMinuteBorderColor,
                  width: hourMinuteBorderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    hourMinuteBorderCornerRadius,
                  ),
                ),
                borderSide: BorderSide(
                  color: hourMinuteBorderColor,
                  width: hourMinuteBorderWidth,
                ),
              ),
            ),
            entryModeIconColor: entryModelColor,
          ),
        ),
        child: child!,
      );
    },
  );
  onTapAction(time!);
  // debugPrint("Time = $time");
}

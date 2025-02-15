import 'package:flutter/material.dart';

Future<DateTime?> displayDatePicker({
  required BuildContext context,
  DatePickerEntryMode entryMode = DatePickerEntryMode.calendarOnly,
  Color containerColor = const Color(0xFFEFE6F7),
  Color containerBorderColor = Colors.transparent,
  double containerBorderWidth = 1,
  double containerBorderCornerRadius = 20.0,
  Color confirmButtonBackgroundColor = Colors.transparent,
  Color confirmButtonFontColor = const Color(0xFF6750A4),
  double confirmButtonFontSize = 16.0,
  FontWeight confirmButtonFontWeight = FontWeight.w800,
  Color cancelButtonBackgroundColor = Colors.transparent,
  Color cancelButtonFontColor = const Color(0xFF6750A4),
  double cancelButtonFontSize = 16.0,
  FontWeight cancelButtonFontWeight = FontWeight.w800,
  Color headerBackgroundColor = const Color(0xFFEFE6F7),
  double headerHeadlineSize = 32.0,
  Color headerHeadlineColor = Colors.black,
  FontWeight headerHeadlineWeight = FontWeight.normal,
  double headerHelpFontSize = 14.0,
  FontWeight headerHelpFontWeight = FontWeight.w500,
  Color headerHelpFontColor = const Color(0xFF444746),
  Color dividerColor = const Color(0xFF444746),
  double dayFontSize = 12.0,
  Color dayUnSelectedBackgroundColor = Colors.transparent,
  Color daySelectedBackgroundColor = const Color(0xFF6750A4),
  Color daySelectedForegroundColor = Colors.white,
  Color dayUnSelectedForegroundColor = Colors.black,
  Color weekDayFontColor = Colors.black,
  double weekDayFontSize = 12.0,
  FontWeight weekDayFontWeight = FontWeight.w600,
  Color yearForegroundColor = Colors.black,
  Color yearBackgroundColor = Colors.transparent,
  double yearFontSize = 16.0,
  FontWeight yearFontWeight = FontWeight.w500,
  Color entryModelColor = Colors.black,
}) async {
  return await showDatePicker(
    context: context,
    initialEntryMode: entryMode,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(
            confirmButtonStyle: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                confirmButtonBackgroundColor,
              ),
              foregroundColor: MaterialStatePropertyAll(
                confirmButtonFontColor,
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: confirmButtonFontSize,
                  fontWeight: confirmButtonFontWeight,
                ),
              ),
            ),
            cancelButtonStyle: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(
                confirmButtonFontColor,
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: confirmButtonFontSize,
                  fontWeight: confirmButtonFontWeight,
                ),
              ),
            ),
            surfaceTintColor: Colors.transparent,
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
            headerBackgroundColor: headerBackgroundColor,
            headerHeadlineStyle: TextStyle(
              fontSize: headerHeadlineSize,
              fontWeight: headerHeadlineWeight,
              color: headerHeadlineColor,
            ),
            headerHelpStyle: TextStyle(
              fontSize: headerHelpFontSize,
              fontWeight: headerHelpFontWeight,
              color: headerHelpFontColor,
            ),
            dividerColor: dividerColor,
            dayStyle: TextStyle(
              fontSize: dayFontSize,
            ),
            dayBackgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => states.contains(MaterialState.selected)
                  ? daySelectedBackgroundColor
                  : dayUnSelectedBackgroundColor,
            ),
            dayOverlayColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            dayForegroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => states.contains(MaterialState.selected)
                  ? daySelectedForegroundColor
                  : dayUnSelectedForegroundColor,
            ),
            weekdayStyle: TextStyle(
              fontSize: weekDayFontSize,
              color: weekDayFontColor,
              fontWeight: weekDayFontWeight,
            ),
            yearBackgroundColor: MaterialStateProperty.all(
              yearBackgroundColor,
            ),
            yearForegroundColor: MaterialStateProperty.all(
              yearForegroundColor,
            ),
            yearStyle: TextStyle(
              fontSize: yearFontSize,
              fontWeight: yearFontWeight,
            ),
            todayBackgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => states.contains(MaterialState.selected)
                  ? daySelectedBackgroundColor
                  : dayUnSelectedBackgroundColor,
            ),
            todayForegroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => states.contains(MaterialState.selected)
                  ? daySelectedForegroundColor
                  : dayUnSelectedForegroundColor,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}

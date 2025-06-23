import 'package:flutter/material.dart';

Future<DateTime?> pickCustomDateTime({
  required BuildContext context,
  DateTime? initialDateTime,
  DateTime? firstDate,
  DateTime? lastDate,
  DatePickerEntryMode dateEntryMode = DatePickerEntryMode.calendarOnly,
  Color dateContainerColor = const Color(0xFFEFE6F7),
  Color dateContainerBorderColor = Colors.transparent,
  double dateContainerBorderWidth = 1,
  double dateContainerBorderCornerRadius = 20.0,

  Color dateConfirmButtonFontColor = const Color(0xFF6750A4),
  double dateConfirmButtonFontSize = 16.0,
  FontWeight dateConfirmButtonFontWeight = FontWeight.w800,

  Color dateCancelButtonFontColor = const Color(0xFF6750A4),
  double dateCancelButtonFontSize = 16.0,
  FontWeight dateCancelButtonFontWeight = FontWeight.w800,

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
  Color dateEntryModelColor = Colors.black,
  TimePickerEntryMode timeEntryMode = TimePickerEntryMode.dialOnly,
  Color timeContainerColor = const Color(0xFFEFE6F7),

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
  Color timeEntryModelColor = Colors.black,
}) async {
  final now = DateTime.now();
  final initialDate = initialDateTime ?? now;
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate ?? now,
    lastDate: lastDate ?? DateTime(2100),
    initialEntryMode: dateEntryMode,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(
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
            dayForegroundColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? daySelectedForegroundColor
                      : dayUnSelectedForegroundColor,
            ),
            dayBackgroundColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? daySelectedBackgroundColor
                      : dayUnSelectedBackgroundColor,
            ),
            dayStyle: TextStyle(fontSize: dayFontSize),
            weekdayStyle: TextStyle(
              color: weekDayFontColor,
              fontSize: weekDayFontSize,
              fontWeight: weekDayFontWeight,
            ),
            yearForegroundColor: WidgetStateProperty.all(yearForegroundColor),
            yearBackgroundColor: WidgetStateProperty.all(yearBackgroundColor),
            yearStyle: TextStyle(
              fontSize: yearFontSize,
              fontWeight: yearFontWeight,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(
                dateConfirmButtonFontColor,
              ),
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  fontSize: dateConfirmButtonFontSize,
                  fontWeight: dateConfirmButtonFontWeight,
                ),
              ),
            ),
          ),
          dialogTheme: DialogThemeData(backgroundColor: dateContainerColor),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate == null || !context.mounted) return null;
  final pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initialDate),
    initialEntryMode: timeEntryMode,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: TimePickerThemeData(
            backgroundColor: timeContainerColor,
            hourMinuteShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(hourMinuteBorderCornerRadius),
              side: BorderSide(
                color: hourMinuteBorderColor,
                width: hourMinuteBorderWidth,
              ),
            ),
            hourMinuteTextColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? hourMinuteSelectedFontColor
                      : hourMinuteUnSelectedFontColor,
            ),
            hourMinuteColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? hourMinuteSelectedBgColor
                      : hourMinuteUnSelectedBgColor,
            ),
            dayPeriodShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dayPeriodBorderCornerRadius),
              side: BorderSide(
                color: dayPeriodBorderColor,
                width: dayPeriodBorderWidth,
              ),
            ),
            dayPeriodColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? dayPeriodSelectedBgColor
                      : dayPeriodUnSelectedBgColor,
            ),
            dayPeriodTextColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? dayPeriodSelectedFontColor
                      : dayPeriodUnSelectedFontColor,
            ),
            dayPeriodTextStyle: TextStyle(
              fontSize: dayPeriodFontSize,
              fontWeight: dayPeriodFontWeight,
            ),
            dialHandColor: dialIndicatorColor,
            dialBackgroundColor: dialBackgroundColor,
            dialTextColor: WidgetStateColor.resolveWith(
              (states) =>
                  states.contains(WidgetState.selected)
                      ? dialSelectedFontColor
                      : dialUnSelectedFontColor,
            ),
            entryModeIconColor: timeEntryModelColor,
            helpTextStyle: TextStyle(
              fontSize: headFontSize,
              fontWeight: headFontWeight,
              color: headFontColor,
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedTime == null) return null;

  return DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
  );
}

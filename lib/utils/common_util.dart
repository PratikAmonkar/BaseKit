import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonUtil {
  Future<bool> checkConnection() async {
    // TODO:: add connectivity_plus dependency in pubspec.yaml file compatible version : [connectivity_plus: ^6.0.5]
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  String getDate({
    required int option,
    required String date,
    String optionalDate = "",
  }) {
    // TODO:: add intl dependency in pubspec.yaml file compatible version : [intl: ^0.20.1]
    try {
      switch (option) {
        case 1:
          DateTime parsedDate = DateTime.parse(date);
          var formatter = DateFormat('MMMM dd, yyyy');
          return formatter.format(parsedDate);

        case 2:
          DateTime parsedDate = DateTime.parse(date);
          var formatter = DateFormat('dd/MM/yyyy');
          return formatter.format(parsedDate);

        case 3:
          DateTime parsedDate = DateTime.parse(date);
          var formatter = DateFormat('MMMM d, yyyy');
          return formatter.format(parsedDate);

        case 4:
          {
            DateTime dateTime = DateTime.parse(date);
            final DateFormat formatter = DateFormat("d MMM yy, h:mm a");
            return formatter.format(dateTime);
          }

        case 5:
          {
            DateTime parsedDate = DateTime.parse(date);
            return DateFormat("MMM dd yyyy").format(parsedDate);
          }

        case 6:
          {
            DateTime dateTime = DateTime.parse(date);
            String formattedDate = DateFormat('EEEE d MMM yy').format(dateTime);
            return formattedDate;
          }

        case 7:
          {
            DateTime dateTime = DateTime.parse(date);
            DateFormat formatter = DateFormat('MMM');
            return formatter.format(dateTime);
          }

        case 8:
          {
            DateTime dateTime = DateTime.parse(date);
            DateFormat dateFormat = DateFormat('dd MMM');
            return dateFormat.format(dateTime);
          }
        case 9:
          DateTime start = DateTime.parse(date);
          DateTime end = DateTime.parse(optionalDate);
          Duration diff = end.difference(start);

          int days = diff.inDays;
          int months = (days / 30).round();
          int years = (months / 12).floor();

          if (years >= 1) {
            int remainingMonths = months % 12;
            if (remainingMonths > 0) {
              return "$years ${years == 1 ? 'year' : 'years'} $remainingMonths ${remainingMonths == 1 ? 'month' : 'months'}";
            } else {
              return "$years ${years == 1 ? 'year' : 'years'}";
            }
          } else if (months >= 1) {
            return "$months ${months == 1 ? 'month' : 'months'}";
          } else if (days >= 7) {
            int weeks = (days / 7).round();
            return "$weeks ${weeks == 1 ? 'week' : 'weeks'}";
          } else {
            return "$days ${days == 1 ? 'day' : 'days'}";
          }

        case 10:
          {
            DateTime dateTime = DateTime.parse(date);
            String formattedDate = DateFormat('d MMM yy').format(dateTime);
            return formattedDate;
          }
        default:
          return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  String getTime(
    int option,
    String dateTime, {
    String optionalDateTime = "",
    Duration extraWorkTime = Duration.zero,
  }) {
    try {
      switch (option) {
        case 1:
          {
            DateTime parseDateTime = DateTime.parse(dateTime);
            String formattedTime =
                DateFormat('hh:mm:ss a').format(parseDateTime);
            return formattedTime;
          }

        case 2:
          {
            DateTime date1 = DateTime.parse(dateTime);
            DateTime date2 = DateTime.parse(optionalDateTime);
            Duration difference = date2.difference(date1);
            int totalHours = difference.inHours;
            int remainingMinutes = difference.inMinutes % 60;
            return "$totalHours hr $remainingMinutes m";
          }

        case 3:
          {
            final DateFormat formatter = DateFormat.jm();
            DateTime parseDateTime = DateTime.parse(dateTime);
            return formatter.format(parseDateTime);
          }

        case 4:
          {
            DateTime parseDateTime = DateTime.parse(dateTime);
            return parseDateTime.day.toString();
          }

        case 5:
          {
            DateTime startDate = DateTime.parse(dateTime);
            DateTime endDate = DateTime.parse(optionalDateTime);
            Duration dateDifference = endDate.difference(startDate);
            Duration totalDuration = dateDifference + extraWorkTime;
            return "${totalDuration.inHours} hr ${totalDuration.inMinutes % 60} m";
          }
        case 6:
          {
            DateFormat format = DateFormat('hh:mm:ss a');
            DateTime formatedDate = format.parse(dateTime);
            DateTime now = DateTime.now();
            DateTime isoDateTime = DateTime(
              now.year,
              now.month,
              now.day,
              formatedDate.hour,
              formatedDate.minute,
              formatedDate.second,
            );

            return isoDateTime.toIso8601String();
          }

        case 7:
          {
            DateFormat format = DateFormat('hh:mm:ss a');
            DateTime checkInDateTime = format.parse(dateTime);
            DateTime checkOutDateTime = format.parse(optionalDateTime);
            Duration workingDuration =
                checkOutDateTime.difference(checkInDateTime);
            int hours = workingDuration.inHours;
            int minutes = workingDuration.inMinutes % 60;
            return '$hours hr $minutes m';
          }
        default:
          {
            return "-";
          }
      }
    } catch (e) {
      return "-";
    }
  }

  String formatIsoFromTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
            now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute)
        .toIso8601String();
  }

  TimeOfDay getTimeOfDayFromIso(String isoString) {
    DateTime dateTime = DateTime.parse(isoString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  String formatTimeFromDuration(Duration duration) {
    int totalSeconds = duration.inSeconds;
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  DateTime getDateTimeFromIso({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime;
  }
}

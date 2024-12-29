import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Resources/valuesManager.dart';

class sharedFunctions_Dates {
  static String getFilterDatesPeriodFromDates(String columnName, DateTime dateFrom, DateTime dateTo) {
    String Filter = 'Convert(DateTime,CONVERT(varchar(10), '
        '$columnName , 103),103) >= \'${DateFormat('yyyy-MM-dd').format(dateFrom)}\' '
        'and Convert(DateTime,CONVERT(varchar(10), $columnName, 103),103) <=\''
        '${DateFormat('yyyy-MM-dd').format(dateTo)}\'';
    return Filter;
  }

  static String getFilterDatesPeriodFromString(String columnName, String shortDateFrom, String shortDateTo) {
    String Filter = 'Convert(DateTime,CONVERT(varchar(10), $columnName , 103),103) >= \''
        '$shortDateFrom\' and Convert(DateTime,CONVERT(varchar(10), '
        '$columnName, 103),103) <=\'$shortDateTo\'';
    return Filter;
  }

  static String convertToShortDateString(DateTime? date) {
    if (date == null) {
      return '';
    }
    String shortDate = DateFormat('yyyy-MM-dd').format(date);
    // print(shortDate);
    return shortDate;
  }

  static DateTime? convertDateStringToDatetime(String? dateShortString) {
    if (dateShortString == null || dateShortString.isEmpty) {
      return null;
    }
    DateTime? shortDate =
    DateTime(int.parse(dateShortString.split('-')[0]), int.parse(dateShortString.split('-')[1]), int.parse(dateShortString.split('-')[2]));

    // print(shortDate);
    return shortDate;
  }

  static TimeOfDay convertDateTimeToTimeOfDay(DateTime date) {
    return TimeOfDay(hour: date.hour, minute: date.minute);
  }

  static String convertTimeToShortTimeString(TimeOfDay? time, context) {
    if (time == null) {
      return '';
    }
    String formattedTime = time.format(context);
    return formattedTime;
  }

  static String convertDateTimeToTimeString(DateTime date) {
    final hours = date.hour % 12; // تحويل إلى 12 ساعة
    final hourString = (hours == 0) ? 12.toString() : hours.toString(); // إذا كانت الساعة 0، اجعلها 12
    final minutes = date.minute.toString().padLeft(2, valuesManager.numberInt.n0.toString());
    final period = date.hour >= 12 ? 'م' : 'ص'; // تحديد الفترة (صباحًا أو مساءً)

    return '$hourString:$minutes $period';
  }

  static TimeOfDay? convertTimeStringToTimeOfDay(String timeString) {
    if (timeString.isEmpty) return null;

    // تحديد صيغة الوقت لتتناسب مع النص المدخل
    DateFormat format = DateFormat.jm(); // صيغة الوقت (ساعة:دقيقة AM/PM)
    String t = convertTimeAR_EN(timeString);
    DateTime dateTime = format.parse(t); // تحويل النص إلى DateTime
    return convertDateTimeToTimeOfDay(dateTime);
  }

  static String formatTimeDuration(Duration duration) {
    String twoDigitMinutes = duration.inMinutes.remainder(60).toString().padLeft(2, valuesManager.numberInt.n0.toString());
    return "${duration.inHours}:$twoDigitMinutes";
  }

  static String convertTimeAR_EN(String timeString) {
    return '${timeString.split(' ').first} ${timeString.split(' ').last == 'ص' ? 'AM' : 'PM'}';
  }

  static double calcDiffBetween2Dates(String dateFrom, String dateTo) {
    int years = convertDateStringToDatetime(dateFrom)!.year - convertDateStringToDatetime(dateTo)!.year;
    int monthes = convertDateStringToDatetime(dateFrom)!.month - convertDateStringToDatetime(dateTo)!.month;
    int dayes = convertDateStringToDatetime(dateFrom)!.day - convertDateStringToDatetime(dateTo)!.day;

    int allDayes = (years * 365) + (monthes * 30) + dayes;
    return double.parse((allDayes / 365).toStringAsFixed(2));
  }

  static double calcDiffBetween2Times(String timeFrom, String timeTo) {
    int years = convertDateStringToDatetime(timeFrom)!.year - convertDateStringToDatetime(timeTo)!.year;
    int monthes = convertDateStringToDatetime(timeFrom)!.month - convertDateStringToDatetime(timeTo)!.month;
    int dayes = convertDateStringToDatetime(timeFrom)!.day - convertDateStringToDatetime(timeTo)!.day;
    int allDayes = (years * 365) + (monthes * 30) + dayes;
    return double.parse((allDayes / 365).toStringAsFixed(2));
  }

  static double calcAge(String birthDate) {
    int years = DateTime.now().year - convertDateStringToDatetime(birthDate)!.year;
    int monthes = DateTime.now().month - convertDateStringToDatetime(birthDate)!.month;
    int dayes = DateTime.now().day - convertDateStringToDatetime(birthDate)!.day;

    int allDayes = (years * 365) + (monthes * 30) + dayes;
    return double.parse((allDayes / 365).toStringAsFixed(2));
  }
}
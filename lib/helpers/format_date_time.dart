import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(date) {
  //...

  try {
    if (date == null) return "";

    final inputFormat = DateFormat(
      'yyyy-MM-dd',
    ); // Assuming the input format is "yyyy-MM-dd [HH:mm:ss]"
    final outputFormat = DateFormat(
      'd/M/yy',
    ); // Desired output format

    DateTime? dateTime;
    String? formattedTime;

    if (date is String) {
      dateTime = inputFormat.parse(date);
    } else if (date is DateTime) {
      dateTime = date;
    }

    if (dateTime is DateTime) {
      formattedTime = outputFormat.format(dateTime);
    }

    return formattedTime ?? "";
  } catch (e) {
    debugPrint(date);
    debugPrint(e.toString());
    return "";
  }
}

String formatDate2(date) {
  //...
  try {
    if (date == null) return "";

    final inputFormat = DateFormat(
      'yyyy-MM-dd',
    ); // Assuming the input format is "yyyy-MM-dd [HH:mm:ss]"
    final outputFormat = DateFormat(
      'EEE, MMM yy',
    );
    // 'Sun, Jun 16'
    // Desired output format

    DateTime? dateTime;
    String? formattedTime;

    if (date is String) {
      dateTime = inputFormat.parse(date);
    } else if (date is DateTime) {
      dateTime = date;
    }

    if (dateTime is DateTime) {
      formattedTime = outputFormat.format(dateTime);
    }

    return formattedTime ?? "";
  } catch (e) {
    debugPrint(date);
    debugPrint(e.toString());
    return "";
  }
}

String formatTime(time) {
  //...
  try {
    if (time == null) return "";

    final inputFormat = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ); // Assuming the input format is "yyyy-MM-dd [HH:mm:ss]"
    final outputFormat = DateFormat(
      'HH:mm',
    );
    // 'Sun, Jun 16'
    // Desired output format

    DateTime? dateTime;
    String? formattedTime;

    if (time is DateTime) {
      dateTime = time;
    } else if (time is String) {
      try {
        dateTime = inputFormat.parse(time);
      } catch (e) {
        dateTime = DateTime.tryParse(time);
      }
    }

    if (dateTime is DateTime) {
      formattedTime = outputFormat.format(dateTime);
    }

    return formattedTime ?? "";
  } catch (e) {
    debugPrint(time);
    debugPrint(e.toString());
    return "";
  }
}

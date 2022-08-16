import 'dart:math';

import 'package:flutter/material.dart';

class HelperFunctions {
  ///Parses a DateTime object into a string
  ///
  ///final dateTime = DateTime(2022, 1, 1 , 10, 30);
  ///
  ///parseStringFromDateTime(dateTime) // "10:30 AM"
  static String parseStringFromDateTime(DateTime dateTime) {

    final hour = dateTime.hour == 12 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute;
    final timeOfDay = dateTime.hour < 12 ? 'AM' : 'PM';
    return '$hour:${minute.toString().padLeft(2, '0')} $timeOfDay';
  }

  ///Creates a DateTime representation of the TimeOfDay object
  static DateTime? parseDateTimeFromTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) {
      return null;
    }
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  ///Generates a random string
  static String getRandomString(int length) {
    const characters =
        '+-*=?AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => characters.codeUnitAt(
          random.nextInt(characters.length),
        ),
      ),
    );
  }
}

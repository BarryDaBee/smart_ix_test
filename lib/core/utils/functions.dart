class HelperFunctions {

  ///TODO: Add example here
  static String parseStringFromDateTime(DateTime dateTime) {
    final hour =  dateTime.hour== 12? 12: dateTime.hour % 12;
    final minute = dateTime.minute;
    final timeOfDay = dateTime.hour < 12 ? 'AM' : 'PM';
    return '$hour:${minute.toString().padLeft(2, '0')} $timeOfDay';
  }
}

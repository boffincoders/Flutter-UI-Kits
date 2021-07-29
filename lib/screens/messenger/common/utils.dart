import 'package:intl/intl.dart';

class Utils {
  DateTime convertToDateTime(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toUtc();
  }

  String getFormattedDate(int seconds) {
    return DateFormat.yMMMd().format(convertToDateTime(seconds));
  }

  String getFormattedTime(int seconds) {
    return DateFormat.jm().format(convertToDateTime(seconds));
  }
  String getFormattedDate2(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }

  String getFormattedTime2(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }
}

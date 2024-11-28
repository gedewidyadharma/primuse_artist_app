import 'package:intl/intl.dart';

class DateFormating {
  static String changeFormatFromString({required String format, required String date}) {
    try {
      var strDate = DateFormat(format).format(
        DateTime.parse(
          DateTime.parse(date).toIso8601String(),
        ),
      );

      return strDate;
    } catch (e) {
      return "-";
    }
  }

  static String changeFormatFromDatetime({required String format, required DateTime? date}) {
    try {
      var strDate = DateFormat(format).format(date!);
      return strDate;
    } catch (e) {
      return "-";
    }
  }

  static DateTime changeFormatToIsoDate({required String date}) {
    var strDate = DateTime.parse(
      DateTime.parse(date).toIso8601String(),
    );

    return strDate;
  }

  static Map<String, int> formatCountdown(int totalSeconds) {
    int days = totalSeconds ~/ (24 * 3600); // Menghitung sisa hari
    int hours = (totalSeconds % (24 * 3600)) ~/ 3600; // Menghitung sisa jam
    int minutes = (totalSeconds % 3600) ~/ 60; // Menghitung sisa menit
    int seconds = totalSeconds % 60; // Menghitung sisa detik

    return {
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
    };
  }
}

import 'package:intl/intl.dart';

class NumberFormating {

  static String formatToK(int number) {
  if (number >= 1000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(1)}K';
  }
  return number.toString();
}

static String toCompactFormat(num number) {
    if (number >= 1000000) {
      final millions = number / 1000000;
      return '${millions.toStringAsFixed(2)}M';
    } else if (number >= 1000) {
      final thousands = number / 1000;
      return '${thousands.toStringAsFixed(2)}K';
    }
    return number.toString();
  }

  String formatNumberSeparator(num number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
}
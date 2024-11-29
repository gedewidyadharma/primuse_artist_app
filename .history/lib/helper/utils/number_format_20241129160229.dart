class NumberFormat {

  static String formatToK(int number) {
  if (number >= 1000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(1)}K';
  }
  return number.toString();
}

static String toCompactFormat(num number) {
    if (this >= 1000000) {
      final millions = this / 1000000;
      return '${millions.toStringAsFixed(2)}M';
    } else if (this >= 1000) {
      final thousands = this / 1000;
      return '${thousands.toStringAsFixed(2)}K';
    }
    return toString();
  }
}
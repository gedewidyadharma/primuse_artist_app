class NumberFormat {

  static String formatToK(int number) {
  if (number >= 1000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(1)}K';
  }
  return number.toString();
}
}
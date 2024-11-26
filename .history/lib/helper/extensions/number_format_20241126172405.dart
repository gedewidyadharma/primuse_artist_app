extension NumberFormat on int {
  String toK() {
    if (this >= 1000) {
      double result = this / 1000;
      return '${result.toStringAsFixed(1)}K';
    }
    return toString();
  }
}
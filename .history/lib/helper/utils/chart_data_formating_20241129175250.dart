
import '../../modules/modules.dart';

class ChartDataFormating {
  static List<ChartData> convertToChartData(Map<String, dynamic> data) {
  return data.entries
    .where((entry) => entry.value != null &&  entry.value > 0)
    .map((entry) {
      // final valueInMillions = (entry.value / 1000000).toStringAsFixed(1);
      return ChartData(
        category: entry.key[0].toUpperCase() + entry.key.substring(1),
        value: entry.value,
      );
    }).toList()
    // ..sort((a, b) => b.value.compareTo(a.value))
    // Ambil top 8 saja jika terlalu banyak
    // .take(8)
    .toList();
}
}
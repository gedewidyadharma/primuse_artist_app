
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../artist_details.dart';

class TopCityListenerItemListView extends StatelessWidget {
 final MonthlyListener data;
 
 const TopCityListenerItemListView({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Nama')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Address')),
            // Tambahkan kolom lainnya
          ],
          rows: List.generate(
            10,
            (index) => DataRow(
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text('User ${index + 1}')),
                DataCell(Text('user$index@email.com')),
                DataCell(Text('+62812345678$index')),
                DataCell(Text('Address $index')),
                // Tambahkan cell lainnya
              ],
            ),
          ),
        ),
      );
  }
}

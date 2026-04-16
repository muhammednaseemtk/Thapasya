import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class CommonDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;

  const CommonDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DataTable2(
        columnSpacing: 20,
        horizontalMargin: 12,
        minWidth: 800,
        headingRowColor:
            MaterialStateProperty.all(Colors.grey.shade100),

        columns: columns,
        rows: rows,
      ),
    );
  }
}
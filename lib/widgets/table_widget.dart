import 'package:flutter/material.dart';


class MyDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 8.0,
      columns: _buildTableColumns(),
      rows: _buildTableRows(),
    );
  }

  List<DataColumn> _buildTableColumns() {
    return [
      DataColumn(label: Text('SL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Description', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
    ];
  }

  List<DataRow> _buildTableRows() {
    return [
      DataRow.byIndex(
        index: 0,
        color: MaterialStateColor.resolveWith((states) {
          return Colors.grey.shade200; // Alternate row color
        }),
        cells: _buildRowCells(['1', 'Item 1', '2', '\$20']),
      ),
      DataRow.byIndex(
        index: 1,
        color: MaterialStateColor.resolveWith((states) {
          return Colors.white; // Alternate row color
        }),
        cells: _buildRowCells(['2', 'Item 2', '1', '\$15']),
      ),
      DataRow.byIndex(
        index: 2,
        color: MaterialStateColor.resolveWith((states) {
          return Colors.grey.shade200; // Alternate row color
        }),
        cells: _buildRowCells(['3', 'Item 3', '3', '\$30']),
      ),
    ];
  }

  List<DataCell> _buildRowCells(List<String> data) {
    return data.map((value) {
      return DataCell(
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Text(value),
        ),
      );
    }).toList();
  }
}
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  CustomTable({
    Key? key,
    required this.dataTable,
  }) : super(key: key);

  final List<List<String>> dataTable;

  Map<int, TableColumnWidth> _setColumnsWidth() {
    final list = List.generate(dataTable.length, (index) => index);

    final map = Map<int, TableColumnWidth>.fromIterable(
      list,
      key: (item) => item,
      value: (_) => FlexColumnWidth(),
    );

    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: _setColumnsWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: dataTable
          .map((row) => TableRow(
                children: row
                    .map((cell) => Container(
                      height: 50,
                          child: Center(
                            child: Text(
                              cell,
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';

class customTable extends StatelessWidget {
  customTable({
    Key? key,
  }) : super(key: key);

  final datas = [
    ["E", "E0", "E1", "E2", "E3"],
    ["0", "E0", "-", "E1", "-"],
    ["1", "-", "E2", "E0", "-"],
    ["2", "E2", "-", "-", "-"],
    ["3", "E1", "E3", "-", "-"],
  ];

  Map<int, TableColumnWidth> _setColumnsWidth() {
    final list = List.generate(datas.length, (index) => index);

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
      children: datas
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

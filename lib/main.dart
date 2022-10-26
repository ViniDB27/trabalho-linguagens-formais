import 'package:flutter/material.dart';

import 'widgets/code_area_view.dart';
import 'widgets/element_state.dart';
import 'widgets/spec_area_view.dart';
import 'widgets/quad_area_view.dart';
import 'widgets/quint_area_view.dart';
import 'widgets/custom_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  final List<String> code = [
    '# include <stdio.h>',
    'int main(void)',
    '{',
    'int a, b, c;',
    'scanf("%d", &a);',
    'scanf("%d", &b);',
    'c = a + b;',
    'printf("%d \\n", c);',
    'return 0;',
    '}',
  ];

  final dataTable = [
    ["E", "E0", "E1", "E2", "E3", "-", "-", "-", "-", "-", "-"],
    ["0", "E0", "-", "E1*", "-", "-", "-", "-", "-", "-", "-"],
    ["1", "-", "E2", "E0*", "-", "-", "-", "-", "-", "-", "-"],
    ["2", "E2*", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["3", "E1", "E3", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["4", "E1", "E3*", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["5", "E1", "E3*", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["6", "E1", "E3*", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["7", "E1", "E3*", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["8", "E1", "E3", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["9", "E1", "E3*", "-", "-", "-", "-", "-", "-", "-", "-"],
    ["10", "E1", "E3*", "-", "-", "-", "-", "-", "-", "-", "-"],
  ];

  List<List<String>> dataTableView = [];

  bool activePlay = false;
  int activeLine = 0;

  _stopBuildCode() {
    setState(() {
      activePlay = false;
      activeLine = 0;
    });
  }

  _playBuildCode() async {
    setState(() {
      activePlay = true;
      dataTableView = [];
    });

    for (int i = 0; i < code.length + 1; i++) {
      activeLine = i;

      List<String> temp = [];
      dataTableView = [...dataTableView, temp];

      final List<String> iterator =
          dataTable[i + 1].where((element) => element != "-").toList();

      for (var j = 0; j < iterator.length; j++) {
        print(dataTable[i + 1][j]);

        temp = [...temp, iterator[j]];

        if (dataTableView.isNotEmpty) {
          dataTableView.removeAt(dataTableView.length - 1);
        }

        setState(() {
          dataTableView.add(temp);
        });

        if (!activePlay) {
          break;
        }

        await Future.delayed(const Duration(milliseconds: 500));
      }

      if (!activePlay) {
        break;
      }
    }

    setState(() {
      activePlay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trabalho"),
      ),
      body: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: mediaQuery.size.width * 0.1,
              height: mediaQuery.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  codeAreaView(
                    code: code,
                    activePlay: activePlay,
                    activeLine: activeLine,
                  ),
                  const EspecAreaView(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: mediaQuery.size.width * 0.1,
              height: mediaQuery.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  QuadAreaView(),
                  QuintAreaView(),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              width: mediaQuery.size.width * 0.35,
              height: mediaQuery.size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTable(dataTable: dataTable),
                ],
              ),
            ),
            Container(
              width: mediaQuery.size.width * 0.35,
              height: mediaQuery.size.height,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: dataTableView
                    .map((elements) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: elements
                            .map((element) => ElementState(
                                  element: element,
                                  isFinal: element.contains("*"),
                                ))
                            .toList()))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !activePlay ? _playBuildCode : _stopBuildCode,
        tooltip: 'Iniciar',
        child: Icon(!activePlay ? Icons.play_arrow : Icons.stop),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

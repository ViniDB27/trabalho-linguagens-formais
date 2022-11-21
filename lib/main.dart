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

  final staticTable = [
    ["E", "<PR>", "<L>", "<AP>", "<FP>"],
    ["E0", "E1, E2", "-", "-", "-"],
    ["E1", "-", "E2", "-", "-"],
    ["E2", "-", "-", "E3", "-"],
    ["E3", "-", "E4", "-", "-"],
    ["E4", "-", "-", "-", "E5*"],
    ["E5*", "-", "-", "-", "-"],
  ];

  List<String> dataTableView = [];

  bool activePlay = false;
  int activeLine = 0;

  void setArrowInfo(String cell) {
    switch (cell) {
      case "E0":
        setState(() => activeLine = 0);
        break;
      case "E2":
        setState(() => activeLine = 2);
        break;
      case "E3":
        setState(() => activeLine = 3);
        break;
      case "E4":
        setState(() => activeLine = 4);
        break;
      case "E5":
        setState(() => activeLine = 5);
        break;
      case "E1,E2":
      default:
        setState(() => activeLine = 1);
        break;
    }
  }

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

    final dataTable = [
      ["E", "<PR>", "<L>", "<AP>", "<FP>"],
      ["E0", "E1, E2", "-", "-", "-"],
      ["E1", "-", "E2", "-", "-"],
      ["E2", "-", "-", "E3", "-"],
      ["E3", "-", "E4", "-", "-"],
      ["E4", "-", "-", "-", "E5*"],
      ["E5*", "-", "-", "-", "-"],
    ];

    dataTable.removeAt(0);

    setState(() => dataTableView.add("E0"));
    setArrowInfo("E0");

    for (var elements in dataTable) {
      elements.removeAt(0);

      setState(() => activeLine += 1);

      for (var element in elements) {
        if (!element.contains("-")) {
          await Future.delayed(const Duration(milliseconds: 1000));

          setArrowInfo(element);
          setState(() {
            dataTableView.add(element);
          });
        }
        if (!activePlay) break;
      }
      if (!activePlay) break;
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
              width: mediaQuery.size.width * 0.25,
              height: mediaQuery.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  codeAreaView(
                    code: code,
                    activePlay: activePlay,
                    activeLine: activeLine,
                  ),
                  const QuadAreaView(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: mediaQuery.size.width * 0.20,
              height: mediaQuery.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const QuintAreaView(),
                  CustomTable(dataTable: staticTable),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              width: mediaQuery.size.width * 0.45,
              height: mediaQuery.size.height,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: dataTableView
                        .map(
                          (element) => ElementState(
                            element: element,
                            isFinal: element.contains("*"),
                          ),
                        )
                        .toList(),
                  )
                ],
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

import 'package:flutter/material.dart';

import 'widgets/code_area_view.dart';
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
    });

    for (int i = 0; i < code.length; i++) {
      if (activePlay) {
        setState(() {
          activeLine = i;
        });
        await Future.delayed(const Duration(milliseconds: 1000));
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
              width: mediaQuery.size.width * 0.2,
              height: mediaQuery.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  codeAreaView(
                    code: code,
                    activePlay: activePlay,
                    activeLine: activeLine,
                  ),
                  const especAreaView()
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: mediaQuery.size.width * 0.2,
              height: mediaQuery.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const quadAreaView(),
                  const SizedBox(height: 10),
                  const quintAreaView(),
                  const SizedBox(height: 10),
                  customTable()
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

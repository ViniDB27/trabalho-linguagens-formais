
import 'package:flutter/material.dart';

class codeAreaView extends StatelessWidget {
  const codeAreaView({
    Key? key,
    required this.code,
    required this.activePlay,
    required this.activeLine,
  }) : super(key: key);

  final List<String> code;
  final bool activePlay;
  final int activeLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Código",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              for (var i = 0; i < code.length; i++)
                Text(
                  code[i],
                  style: TextStyle(
                    color: activePlay && activeLine == i
                        ? Colors.red.shade600
                        : Colors.black,
                    fontSize: 20,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

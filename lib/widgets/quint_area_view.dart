import 'package:flutter/material.dart';

class QuintAreaView extends StatelessWidget {
  const QuintAreaView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Quintupla",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text("K = {E0, E1, E2, E3, E4, E5}"),
              Text("E = {<PR>, <L>, <AP>, <FP>}"),
              Text(""),
              Text("S = t(E0, <PR>) = E1"),
              Text("t(E0, <PR>) = E2"),
              Text("t(E1, <L>) = E2"),
              Text("t(E2, <AP>) = E3"),
              Text("t(E3, <L>) = E4"),
              Text("t(E4, <FP>) = E5"),
              Text(""),
              Text("e0 = {E0}"),
              Text("F = {E5}"),
            ],
          ),
        ],
      ),
    );
  }
}
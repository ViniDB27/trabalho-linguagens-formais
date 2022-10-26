import 'package:flutter/material.dart';

class QuadAreaView extends StatelessWidget {
  const QuadAreaView({
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
                "Quadruplo",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
              Text("6"),
            ],
          ),
        ],
      ),
    );
  }
}
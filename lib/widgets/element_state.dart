import 'package:flutter/material.dart';

class ElementState extends StatelessWidget {
  const ElementState({
    Key? key,
    required this.element,
    this.isFinal = false,
  }) : super(key: key);

  final String element;
  final bool isFinal;

  @override
  Widget build(BuildContext context) {
    List<String> cells = element.split(",");

    String setArrowInfo(String cell) {
      switch (cell) {
        case "E0":
          return "";
        case "E2":
          return "<L>";
        case "E3":
          return "<AP>";
        case "E4":
          return "<L>";
        case "E5*":
          return "<FP>";
        case "E1,E2":
        default:
          return "<PR>";
      }
    }

    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          child: Column(
            children: [
              Text(setArrowInfo(element)),
              const Center(
                child: Text("----->"),
              ),
            ],
          ),
        ),
        isFinal
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(element),
                    ),
                  ),
                ),
              )
            : Column(
                children: cells
                    .map((e) => Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(e),
                          ),
                        ))
                    .toList(),
              )
      ],
    );
  }
}

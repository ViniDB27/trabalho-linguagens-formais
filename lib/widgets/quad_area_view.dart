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
                "Quadrupla",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text("G = (N, T, P, S)"),
              SizedBox(height: 10),
              Text("N = <SIN> ::= {+}"),
              Text("<PR> ::= INT, INCLUDE, RETURN, MAIN"),
              Text("<AP> ::= ("),
              Text("<FP> ::= )"),
              Text("<MNRQ> ::= <"),
              Text("<MARQ> ::= >"),
              Text('<SIM> ::= {=, ", %, \, ., #}'),
              Text("<TER> ::= ;"),
              Text("<VIR> ::= ,"),
              Text("<AC> ::= {"),
              Text("<FC> ::= }"),
              Text("<LEIA> ::= SCANF"),
              Text("<ESCREVA> ::= PRINTF"),
              SizedBox(height: 10),
              Text("T = "),
              Text("<NUM> ::= {0...9}"),
              Text("<L> ::= {a...z/A..Z.}"),
              SizedBox(height: 10),
              Text("<P> = <PR>|<PR><L>|<AP><L><FP>|"),
              Text("<L>|<L><L>|<AC>|<FP>|"),
              Text("<AP>|<FP>|<NUM>|<VIR>|<SIM>|"),
              Text("<TER>|<LEIA>|<ESCREVA><SIM><L>|<SIN><L>"),
              SizedBox(height: 10),
              Text("<L> ::= <P> | <SIM><L><SIM>|<SIM>|<SIM><SIM>|"),
              Text("<PR><NUM><TER>"),
              SizedBox(height: 10),
              Text("<S> ::= <PR>|<PR><L>|<L>|<P>"),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:queze/custWidgetClasses/question.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    print(summary.length);
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ...summary.map((data) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    ((data["Question_index"] as int) + 1).toString(),
                    style: cStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      text(data["Question"], color: Colors.white),
                      text(data["Correct_answer"], color: Colors.green),
                      text(data["selected_answer"], color: Colors.yellowAccent)
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ],
    );
  }
}

Widget text(var str, {Color? color}) {
  return Text(str.toString(),
      textAlign: TextAlign.center, style: TextStyle(color: color));
}

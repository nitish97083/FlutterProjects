import 'package:flutter/material.dart';
import 'package:Quiz/custWidgetClasses/question.dart';

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
            //  color: Colors.red,
            margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: CircleAvatar(
                          backgroundColor:
                              data['selected_answer'] == data['Correct_answer']
                                  ? Colors.green
                                  : Colors.red,
                          child: Text(
                            ((data["Question_index"] as int) + 1).toString(),
                            style: cStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: text(data["Question"],
                            color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      text(data["Correct_answer"], color: Colors.white),
                      Expanded(
                          child: text(data["selected_answer"],
                              color: Colors.yellowAccent))
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

Widget text(var str, {Color? color, var fontSize}) {
  return Text(str.toString(),
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ));
}

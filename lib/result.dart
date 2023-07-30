import 'package:flutter/material.dart';
import 'package:queze/custWidgetClasses/question.dart';
import 'package:queze/custWidgetClasses/reset_buttn.dart';
import 'package:queze/datas/question_data.dart';
import 'package:queze/result_summary.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key, required this.answeredList, required this.restartQuiz});

  final List<String> answeredList;
  final void Function() restartQuiz;

  List<Map<String, Object>> getResultSummary() {
    final List<Map<String, Object>> summary = [];
    print("${answeredList.length}  and ${answeredList[0]}");
    for (var i = 0; i < answeredList.length; i++) {
      summary.add({
        'Question_index': i,
        'Question': question[i].text,
        'Correct_answer': question[i].answer[0],
        'selected_answer': answeredList[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getResultSummary();
    final numberOfQuestion = question.length;
    final correctAnswer = summaryData.where((data) {
      return data['selected_answer'] == data['Correct_answer'];
    }).length;

    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'You answerd $correctAnswer out of $numberOfQuestion question correctly!',
              style: cStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 2.5,
              child: ResultSummary(summary: getResultSummary())),
          ResetButton(restartQuiz: restartQuiz),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

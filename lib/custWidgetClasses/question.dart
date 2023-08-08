import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Quiz/custWidgetClasses/answerButton.dart';
import 'package:Quiz/datas/question_data.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<Question> createState() => _Question();
}

class _Question extends State<Question> {
  var currentIndex = 0;

  void changeIndex(String answerSelected) {
    widget.onSelectedAnswer(answerSelected);
    setState(() {
      currentIndex++;
      print("Change Index Value  $currentIndex and ${question.length}");
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var currentList;

  @override
  Widget build(BuildContext context) {
    currentList = question[currentIndex];
    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: ListView(children: [
          Text(
            currentList.text,
            style: cStyle(fontSize: 25.0),
          ),
          ...currentList.getSuffleAnswer().map((answer) => AnswerButton(
              text: answer,
              onTap: () {
                changeIndex(answer);
              })),
        ]),
      ),
    );
  }
}

TextStyle cStyle({double? fontSize}) {
  return GoogleFonts.lato(
      color: Colors.white, fontSize: fontSize, fontStyle: FontStyle.italic);
}

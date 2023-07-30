import 'package:flutter/material.dart';
import 'package:queze/custWidgetClasses/question.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key, required this.correctAnswer});
  final int correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Opacity(
            opacity: 0.9,
            child: Image.asset(
              "assets/images/congrat.PNG",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Congrats!! You got $correctAnswer out of $correctAnswer",
            style: cStyle(fontSize: 60),
          ),
        ],
      ),
    );
  }
}

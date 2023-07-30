// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

import 'question.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final void Function() onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 140, 100, 97),
            foregroundColor: const Color.fromARGB(255, 58, 57, 57),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onTap,
        child: Text(
          text,
          style: cStyle(),
        ));
  }
}

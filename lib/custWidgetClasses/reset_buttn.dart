import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  ResetButton({super.key, required this.restartQuiz});
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.restore),
      onPressed: restartQuiz,
      style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
      label: const Text("Reset Quiz"),
    );
  }
}

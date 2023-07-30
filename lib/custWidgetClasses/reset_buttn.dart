import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  ResetButton({super.key, required this.restartQuiz});
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.restart_alt_rounded),
      onPressed: restartQuiz,
      style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
      label: const Text("Restart Quiz"),
    );
  }
}

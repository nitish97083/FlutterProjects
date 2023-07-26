import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceROller();
  }
}

final random = Random();

class _DiceROller extends State<DiceRoller> {
  var diceValue = 1;
  void rollDice() {
    setState(() {
      diceValue = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice/dice-$diceValue.JPG",
          width: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}

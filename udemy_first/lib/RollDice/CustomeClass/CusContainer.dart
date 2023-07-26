// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:udemy_first/RollDice/CustomeClass/DiceRoller.dart';

// ignore: must_be_immutable
class CustContainer extends StatelessWidget {
  CustContainer({super.key, required this.colors});

  var beginAlignmnet = Alignment.topLeft;
  var endAlignment = Alignment.bottomRight;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors, begin: beginAlignmnet, end: endAlignment),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}

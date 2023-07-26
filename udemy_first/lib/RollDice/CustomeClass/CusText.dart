// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustText extends StatelessWidget {
  final String text;
  final Color color;
  // ignore: prefer_typing_uninitialized_variables
  final fontSize;
  const CustText(
      {super.key, required this.text, required this.color, this.fontSize});

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}

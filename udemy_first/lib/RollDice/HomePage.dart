// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:udemy_first/RollDice/CustomeClass/CusContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(66, 29, 29, 29),
        appBar: AppBar(
          title: const Text("First App"),
        ),
        // ignore: prefer_const_constructors
        body: CustContainer(
          colors: const [
            Color.fromARGB(255, 24, 23, 23),
            Color.fromARGB(66, 48, 34, 34)
          ],
        ));
  }
}

// ignore: file_names
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Queze"),
          backgroundColor: const Color.fromARGB(150, 87, 82, 82),
        ),
        backgroundColor: const Color.fromARGB(137, 46, 44, 44),
        body: Container());
  }
}

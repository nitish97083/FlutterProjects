import 'package:flutter/material.dart';
import 'package:test2/Utilitis/CustomeTextStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      drawer: Drawer(),
      body: Center(
          child: Container(
        child: Text('This is first App'),
        color: Colors.red,
      )),
    );
  }
}

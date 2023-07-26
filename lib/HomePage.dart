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
        backgroundColor: const Color.fromARGB(96, 87, 82, 82),
      ),
      backgroundColor: Color.fromARGB(137, 46, 44, 44),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Image.asset(
                "assets/images/q_mark.JPG",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Lern Flutter the fun way!",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              width: MediaQuery.of(context).size.width / 2,
              //color: Colors.amberAccent,
              child: InkWell(
                  child: TextButton(
                      onPressed: () {}, child: const Text("Start Qeize"))),
            )
          ],
        ),
      ),
    );
  }
}

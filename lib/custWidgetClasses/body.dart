import 'package:flutter/material.dart';

class CustBody extends StatefulWidget {
  const CustBody(this.switchScreen, {super.key});

  final void Function() switchScreen;
  @override
  // ignore: no_logic_in_create_state
  State<CustBody> createState() => _CustBodyState(switchScreen);
}

class _CustBodyState extends State<CustBody> {
  final void Function() switchScreen;
  _CustBodyState(this.switchScreen);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/q_mark.JPG",
            fit: BoxFit.fill,
            // color: Color.fromARGB(255, 255, 255, 255),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_forward_outlined),
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text("Start Quiz"),
          ),
          Container(
            height: 20,
            width: 20,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

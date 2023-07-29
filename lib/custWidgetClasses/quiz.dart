import 'package:flutter/material.dart';
import 'package:queze/custWidgetClasses/body.dart';
import 'package:queze/custWidgetClasses/question.dart';
import 'package:queze/datas/question_data.dart';
import 'package:queze/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = "Start-screen";

  List<String> answersList = [];

  void switchScreen() {
    setState(() {
      activeScreen = "Question-screen";
      answersList = [];
    });
  }

  void choosedAnswer(String answer) {
    answersList.add(answer);
    if (answersList.length == question.length) {
      for (String str in answersList) {
        print("Selected Answer $str");
      }
      setState(() {
        activeScreen = "Result-screen";
        //
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = CustBody(switchScreen);

    if (activeScreen == "Question-screen") {
      currentScreen = Question(
        onSelectedAnswer: choosedAnswer,
      );
    }

    if (activeScreen == "Result-screen") {
      currentScreen = Result(
        answeredList: answersList,
        restartQuiz: switchScreen,
      );
    }
    return MaterialApp(
        color: const Color.fromARGB(255, 37, 36, 35),
        title: 'Flutter Demo',
        // theme: ThemeData(
        //     // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //     //  useMaterial3: true,
        //     brightness: Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Quiz"),
            backgroundColor: const Color.fromARGB(149, 117, 107, 107),
          ),
          body: currentScreen,
          backgroundColor: const Color.fromARGB(136, 145, 106, 106),
        ));
  }
}

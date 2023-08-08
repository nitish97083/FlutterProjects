import 'package:flutter/material.dart';
import 'package:quiz/congratulation.dart';
import 'package:quiz/custWidgetClasses/body.dart';
import 'package:quiz/custWidgetClasses/question.dart';
import 'package:quiz/datas/question_data.dart';
import 'package:quiz/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String _activeScreen = "Start-screen";

  List<String> answersList = [];

  void switchScreen() {
    setState(() {
      _activeScreen = "Question-screen";
      answersList = [];
    });
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = "Question-screen";
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
        _activeScreen = "Result-screen";
        conratPage();
        //
      });
    }
  }

  void conratPage() {
    for (int i = 0; i < answersList.length; i++) {
      if (answersList[i] == question[i].answer[0]) {
        setState(() {
          _activeScreen = "Congrat-screen";
          //
        });
      } else {
        setState(() {
          _activeScreen = "Result-screen";
          //
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = CustBody(switchScreen);

    if (_activeScreen == "Question-screen") {
      currentScreen = Question(
        onSelectedAnswer: choosedAnswer,
      );
    }

    if (_activeScreen == "Result-screen") {
      currentScreen = Result(
        answeredList: answersList,
        restartQuiz: restartQuiz,
      );
    }
    if (_activeScreen == "Congrat-screen") {
      currentScreen = Congratulation(correctAnswer: answersList.length);
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

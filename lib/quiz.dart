import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_answer.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedAnswer = [];
  var activeScreen = 'quiz-screen';

  // @override
  // void initState() {
  //   activeScreen = Quiz(switchScreen);
  //   super.initState();
  // }
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void restartQuiz() {
    selectedAnswer = [];
    setState(() {
      activeScreen = "quiz-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidget =
    //     activeScreen == "quiz-screen" ? Quiz(switchScreen) : const Question();
    Widget screenWidget = Quiz(switchScreen);
    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswer,
        restartQuiz: restartQuiz,
      );
      // selectedAnswer = [];
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 67, 16, 150),
                Color.fromARGB(255, 71, 16, 97),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

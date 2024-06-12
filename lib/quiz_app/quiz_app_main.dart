import 'package:flutter/material.dart';
import 'package:flutter_guide/quiz_app/data/questions.dart';
import 'package:flutter_guide/quiz_app/questions_screen.dart';
import 'package:flutter_guide/quiz_app/results_screen.dart';
import 'package:flutter_guide/quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
      selectedAnswers.add(answer);
      if(selectedAnswers.length == questions.length){
        setState(() {
          selectedAnswers = [];
          activeScreen = 'results-screen';
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen'){
      screenWidget =  QuestionsScreen(onSelectAnswer: chooseAnswer);
    }else if (activeScreen == 'results-screen'){
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: const Text("Quiz App"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purpleAccent, Colors.purple],
            stops: [0.3, 0.7],
          ),
        ),
        child: screenWidget,
      ),
    );
  }
}

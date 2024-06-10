import 'package:flutter/material.dart';
import 'package:flutter_guide/quiz_app/questions_screen.dart';
import 'package:flutter_guide/quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  switchScreen(){
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
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
        child: activeScreen,
      ),
    );
  }
}

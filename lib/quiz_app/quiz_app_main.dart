import 'package:flutter/material.dart';
import 'package:flutter_guide/quiz_app/start_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: const Text("Quiz App"),
      ),
      body: const StartScreen(),
    );
  }
}

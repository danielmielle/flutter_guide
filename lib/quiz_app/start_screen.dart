import 'package:flutter/material.dart';

import '../common/styled_text.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 260,
            ),
          ),
          const SizedBox(height: 50),
          const StyledText('Learn Flutter the fun way!', 20, FontWeight.bold,
              Colors.white),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const StyledText(
                'Start Quiz', 18, FontWeight.normal, Colors.white),
          ),
        ],
      ),
    );
  }

}
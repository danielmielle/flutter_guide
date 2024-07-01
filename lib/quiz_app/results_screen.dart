import 'package:flutter/material.dart';
import 'package:flutter_guide/quiz_app/data/questions.dart';
import 'package:flutter_guide/quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,{
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numberTotalQuestions questions correctly.',
            style: GoogleFonts.acme(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(summaryData: summaryData),
          TextButton(
            onPressed: restartQuiz,
            child: Text(
              'Restart Quiz',
              style: GoogleFonts.acme(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

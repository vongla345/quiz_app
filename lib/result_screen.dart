import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_answer.dart';
import 'package:quiz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.restartQuiz,
  });
  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': question[i].text,
          'correct_answer': question[i].answer[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = question.length;
    final numCorrectAnswer = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answer $numCorrectAnswer out of $numTotalQuestion questions",
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 194, 167, 240),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(
              summaryData: summaryData,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: restartQuiz,
              child: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}

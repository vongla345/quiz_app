import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions_answer.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
  });
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var curQuestionIndex = 0;

  void nextAnswer(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      curQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var curQuestion = question[curQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curQuestion.text,
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 176, 161, 229),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...curQuestion.shuffleAnswer.map((answer) {
              return AnswerButton(
                  textAnswer: answer,
                  onTap: () {
                    nextAnswer(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}

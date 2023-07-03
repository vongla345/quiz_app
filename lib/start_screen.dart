import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatelessWidget {
  const Quiz(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(111, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 44, 12, 59),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}

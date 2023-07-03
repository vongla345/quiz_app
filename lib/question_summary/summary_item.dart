import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_summary/item_index.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.itemData,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'] ? true : false;
    return Row(
      children: [
        ItemIndex(
          itemIndex: itemData['question_index'] as int,
          correctItem: isCorrectAnswer,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                itemData['question'] as String,
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(239, 231, 231, 246),
                  fontSize: 18,
                ),
              ),
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(70, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(213, 186, 188, 231),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

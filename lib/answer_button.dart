import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({
    super.key,
    required this.textAnswer,
    required this.onTap,
  });
  final String textAnswer;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Text(
        textAnswer,
        textAlign: TextAlign.center,
      ),
    );
  }
}

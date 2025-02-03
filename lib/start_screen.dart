import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 80),
          Text(
            "Let's Start Flutter Quiz",
            style: GoogleFonts.lato(
                color: Color.fromARGB(150, 255, 255, 255), fontSize: 24),
          ),
          SizedBox(height: 80),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}

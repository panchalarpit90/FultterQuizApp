import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/answer_button.dart';
import 'package:fultter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAns,{super.key});
  final void Function(String ans) onSelectAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex=0;

  void ansQuestion(String selectedAns){
  widget.onSelectAns(selectedAns);
    setState(() {
     currentQuestionIndex++;
    });
  }
  @override
  Widget build(context) {
    final  currentQuestion= questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.text,
               textAlign:TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white,fontSize: 22 ,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAns().map((ans){
              return AnswerButton((){
                ansQuestion(ans);
              }, ans);
            })
          ],
        ),
      ),
    );
  }
}


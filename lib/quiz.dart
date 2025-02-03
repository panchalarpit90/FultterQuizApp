import 'package:flutter/material.dart';
import 'package:fultter_quiz_app/data/questions.dart';
import 'package:fultter_quiz_app/questions_screen.dart';
import 'package:fultter_quiz_app/result_screen.dart';
import 'package:fultter_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}
class _QuizState extends State<Quiz>{
  var activeScreen='start_screen';
   List<String> selectedAns=[];

 void chooseAns(String userAns){
  selectedAns.add(userAns);
  if(selectedAns.length==questions.length){
   setState(() {
      activeScreen='result_screen';
   });
  }
 }
 
  void restartQuiz() {
    setState(() {
      selectedAns = [];
      activeScreen = 'questions-screen';
    });
  }

 void switchScreen(){
  setState(() {
    activeScreen='questions_screen';
  });
 }
  @override
  Widget build(context) {
   Widget screenWidget=StartScreen(switchScreen);
   if(activeScreen=='questions_screen'){
    screenWidget=QuestionsScreen(chooseAns);
   }
   if(activeScreen=='result_screen'){
    screenWidget=ResultScreen(chosenAns:selectedAns,restartQuiz:restartQuiz);
   }

   return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 78, 13, 151),
                const Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }

}
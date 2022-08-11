import 'package:flutter/material.dart';
import 'package:simple_quiz_app/pages/quiz_page.dart';

import '../question_set.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = '/result';
  int rightAnswers = 0;
  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateResult();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('images/bg-1.gif',
                fit: BoxFit.cover,
              ),
            ),
            Image.asset('images/giphy.gif', width: 180,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Correct Answers',style: TextStyle(fontSize: 24),),
                  Text('$rightAnswers', style: const TextStyle(fontSize: 40),),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, QuizPage.routeName),
                    child: const Text('Go Back',style: TextStyle(fontSize: 24),),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  calculateResult() {
    for(var question in questionList) {
      if(question.givenAnswer == question.rightAnswer) {
        rightAnswers++;
      }
    }
    for (var element in questionList) {
      element.givenAnswer='';
    }
  }


}

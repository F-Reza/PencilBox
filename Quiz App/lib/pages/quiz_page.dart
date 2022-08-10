
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_quiz_app/customwidgets/question_set_widget.dart';
import 'package:simple_quiz_app/pages/result_page.dart';
import 'package:simple_quiz_app/question_set.dart';



class QuizPage extends StatefulWidget {
  static const String routeName = '/';
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Size size;
  late Timer timer;
  int tick = 300;
  String timeString = '';
  bool hasQuizStarted = false;
  @override
  void didChangeDependencies() {
    setTime();
    super.didChangeDependencies();
  }

  void setTime() {
    timeString = DateFormat('mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(tick * 1000));
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if(tick <= 0) {
        timer.cancel();
        navigateToResult();
      } else {
        setState(() {
          tick--;
          setTime();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              timer.cancel();
              navigateToResult();

            },
            child: hasQuizStarted ?
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text('FINISH', style: TextStyle(color: Colors.white),),
            ) :const SizedBox(),
          )
        ],
      ),
      body: Container(
          width: size.width,
          height: size.height,
        child: Stack(
          children: [
            if(!hasQuizStarted) Positioned.fill(
                child: Image.asset('images/bg.gif',
                  fit: BoxFit.cover,
                ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$timeString', style: TextStyle(fontSize: 50),),
                  if(!hasQuizStarted) ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasQuizStarted = true;
                      });
                      startTimer();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                    child: const Text('Start Quiz'),
                  ),
                  if(hasQuizStarted) Expanded(
                    child: ListView.builder(
                      itemCount: questionList.length,
                      itemBuilder: (context, index) {
                        final question = questionList[index];
                        return QuestionSetView(
                          index: index,
                          question: question,
                          onAnswered: (value) {
                            questionList[index].givenAnswer = value;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
  navigateToResult() => Navigator.pushReplacementNamed(context, ResultPage.routeName);
}

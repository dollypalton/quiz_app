import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz-brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white30,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int correctScore = 0;

  void checkAnswers(bool userAnswers) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (userAnswers == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      quizBrain.checkQuestions();

      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "QUIZ IS OVER",
                desc: "Start a new quiz.")
            .show();

        quizBrain.reset();

        scoreKeeper = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          quizBrain.getQuestionType(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        Card(
          color: Colors.green,
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FlatButton(
              onPressed: () {
                checkAnswers(true);
              },
              child: Text(
                'TRUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Card(
          color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FlatButton(
              onPressed: () {
                checkAnswers(false);
              },
              child: Text(
                'FALSE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ],
    );
  }
}

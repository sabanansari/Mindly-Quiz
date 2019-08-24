import 'package:flutter/material.dart';
import 'quizBrain.dart';

void main() {
  runApp(Quiz());
}

QuizBrain quizBrain = QuizBrain();

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Mindly Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.all(10.0), child: QuizArea())),
    ));
  }
}

class QuizArea extends StatefulWidget {
  @override
  _QuizAreaState createState() => _QuizAreaState();
}

class _QuizAreaState extends State<QuizArea> {
  List<Icon> score = [];

  void checkAnswer(bool usersAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.isFininshed() == true) {
        quizBrain.reset();
        score = [];
      } else {
        if (correctAnswer == usersAnswer) {
          score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
            ),
          ),
          Row(
            children: score,
          )
        ]);
  }
}

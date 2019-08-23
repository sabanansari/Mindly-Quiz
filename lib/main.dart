import 'package:flutter/material.dart';

void main() {
  runApp(Quiz());
}

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
                'dfd',
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
                  onPressed: () {},
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
                  onPressed: () {},
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

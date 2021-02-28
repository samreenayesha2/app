import 'package:app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State createState() => new _AppState();
}

class _AppState extends State<App> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Rabit', 'score': 10},
        {'text': 'Snake', 'score': 6},
        {'text': 'Elephant', 'score': 9},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  var _questionsIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    // var aBool= true;
    // aBool=false;

    _totalScore += score;

    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
    print(_questionsIndex);
    if (_questionsIndex < _questions.length) {
      print('We have no more questions!');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
//var dummy = ['Hello'];
//dummy.add('Max');
//print(dummy);
//dummy [];
    //questions = [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionsIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}

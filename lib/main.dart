import "package:flutter/material.dart";

import "./quiz.dart";
import "./result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", 'score': 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 1},
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 5},
        {"text": "Elephant", "score": 10}
      ]
    },
    {
      "questionText": "Who is your favorite instructor?",
      "answers": [
        {"text": "Caleb", "score": 5},
        {"text": "Max", "score": 5},
        {"text": "David", "score": 1}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print("we have more questions");
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;

  Result(this.resultScore, this.reset);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "You are normal";
    } else if (resultScore <= 12) {
      resultText = "You are a bit out of the ordinary";
    } else if (resultScore <= 16) {
      resultText = "You are funky";
    } else {
      resultText = "You are a freak";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart Quiz"),
            onPressed: reset,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

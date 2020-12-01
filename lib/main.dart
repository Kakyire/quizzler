import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

void main() => runApp(Quizler());

QuizBrain brain = QuizBrain();

class Quizler extends StatefulWidget {
  @override
  _QuizlerState createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  List<Icon> scoreIcon = [];

  void scoreCheck(bool answer) {
    setState(() {
      if (answer == brain.getAnswer()) {
        scoreIcon.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreIcon.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (!brain.nextQuestion()) {
        brain = QuizBrain();
        scoreIcon.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      brain.getQuestion(),
                      style: TextStyle(color: Colors.white, fontSize: 35.0),
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () => scoreCheck(true),
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () => scoreCheck(false),
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: scoreIcon,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

void main() => runApp(new MaterialApp(home: Tick_List(),));

class Tick_List extends StatefulWidget {
  @override
  _Tick_ListState createState() => _Tick_ListState();
}

class _Tick_ListState extends State<Tick_List> {

  List <Icon> checkList = [];
  int correctAnswer = 0;
  QuizBrain quiz = new QuizBrain();
  void alerts(){
    int temp_score = correctAnswer;
    setState(() {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Congratulations!",
        desc: "You have completed the quiz successfully.",
        buttons: [
          DialogButton(
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          ),
          DialogButton(
            child: Text(
              'Check Scores',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                Alert(
                  context: context,
                  type: AlertType.info,
                  title: "Score",
                  desc: "Your score is: ${temp_score}",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Exit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => exit(0),
                      width: 120,
                    ),
                  ],
                ).show();

              });
            },
          )
        ],
      ).show();
    });
    checkList = [];
    quiz.resetQuestion();
    correctAnswer = 0;
  }
  void checkAnswer(bool userAnswer) {
    bool correctAns = quiz.getCorrectAnswer();
    if (correctAns == userAnswer) {
      checkList.add(Icon(Icons.check, color: Colors.green,),);
      correctAnswer++;
    }
    else
      checkList.add(Icon(Icons.close, color: Colors.red,),);
    setState(() {
      quiz.incrementQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      quiz.getQuestion(),
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, right: 24, left: 24, bottom: 12),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text('True',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        if(quiz.checkLimit()==false) {
                          checkAnswer(true);
                        }
                        else
                          alerts();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 24, left: 24, right: 24),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text('False',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        if(quiz.checkLimit()==false)
                          checkAnswer(false);
                        else
                          alerts();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Wrap(
                  children: checkList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

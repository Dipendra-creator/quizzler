import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    "Are You a Human?",
    "Do You Have 2 Legs?",
    "You are Holding Android Phone",
    "You have Dog?",
  ];
  List<bool> answers = [
    true,
    true,
    false,
    false,
  ];
  int count = 0;
  // ignore: missing_return
  Expanded checkingAnswer(bool correctAnswer, bool yourAnswer){
    if (correctAnswer == yourAnswer){
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    }
    else{
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[count],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answers[count];
                checkingAnswer(correctAnswer, true);

                setState(() {
                  if (questions.length > count+1){
                    count++;
                  }
                  else{
                    count = count;
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Finish",
                      desc: "You Have Successfully Finished Quiz.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    count = 0;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answers[count];
                checkingAnswer(correctAnswer, false);
                setState(() {
                  if (questions.length > count + 1){
                    count++;
                  }
                  else{
                    count = count;
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Finish",
                      desc: "You Have Successfully Finished Quiz.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    count = 0;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

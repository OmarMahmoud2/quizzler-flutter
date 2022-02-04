import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'quizbrain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzler'),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  List<Icon> scores = [];
  void checkAns(bool userans) {
  bool answer = quizbrain.GetA();
  if (answer == userans) {
  scores.add(Icon(Icons.check, color: Colors.green,),);
  } else {
  scores.add(Icon(Icons.close, color: Colors.red,),);
  }
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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.GetQ(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
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
                //The user picked true.
                checkAns(true);
                setState(() {
                   bool end = quizbrain.nextQ();
                   if (end) {
                     Alert(context: context, title: "Hooray", desc: "You\'ve finished the quiz, Congrats.").show();
                     scores.clear();
                   }
                   else {}
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
               checkAns(false);
                setState(() {
                  bool end = quizbrain.nextQ();
                  if (end) {
                    Alert(context: context, title: "Hooray", desc: "You\'ve finished the quiz, Congrats.").show();
                    scores.clear();
                  }
                  else {}
                });
              },
            ),
          ),
        ),
        Row(
          children: scores,
        ),
      ],
    );
  }
}

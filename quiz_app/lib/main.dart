import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(MaterialApp(
    home: QuizApp(),
  ));
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<QuizApp> {
  var _questionIndex = 0;

  final _questionBank = [
    Question.name(
        "Grand Central Terminal, Park Avenue, New York is the world's largest railway station",
        true),
    Question.name("Entomology is the science that studies Insects", true),
    Question.name(
        "Eritrea, which became the 182nd member of the UN in 1993, is in the continent of Asia",
        false),
    Question.name("Garampani sanctuary is located at Kohima, Nagaland", false),
    Question.name(
        "Hitler party which came into power in 1933 is known as Nazi party",
        true),
    Question.name(
        "Exposure to sunlight helps a person improve his health because the pigment cells in the skin get stimulated and produce a healthy tan",
        false),
    Question.name("First China War was fought between China and Greece", false)
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("True Citizen"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  height: 120.0,
                  alignment: Alignment.center,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      _questionBank[_questionIndex].questionText!,
                      style: TextStyle(fontSize: 16.9, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Back Button
                  ElevatedButton(
                    child: Icon(Icons.arrow_back),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade900,
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        _questionIndex =
                            (_questionIndex - 1) % _questionBank.length;
                      });
                    },
                  ),

                  // True Button
                  ElevatedButton(
                    child: Text("TRUE"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade900,
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () => _processAnswerForQuestion(
                        _questionIndex, true, context),
                  ),

                  // False Button
                  ElevatedButton(
                    child: Text("FALSE"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade900,
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () => _processAnswerForQuestion(
                        _questionIndex, false, context),
                  ),

                  // Next Image Button
                  ElevatedButton(
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        _questionIndex =
                            (_questionIndex + 1) % _questionBank.length;
                      });
                    },
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      );

  void _processAnswerForQuestion(
      int index, bool selectedAnswer, BuildContext context) {
    if (_questionBank[index].isCorrect == selectedAnswer) {
      setState(() {
        _questionIndex = (_questionIndex + 1) % _questionBank.length;
      });
      var snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text("Correct Answer!!!"),
        duration: Duration(microseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      var snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Wrong Answer!!!"),
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}

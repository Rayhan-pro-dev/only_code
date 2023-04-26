import 'package:quiz_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class QuizBrain {
  final List<Question> _questionBank = [
    Question(question: 'My name is ashik', ans: true),
    Question(question: 'I Am on the way to success', ans: true),
    Question(question: 'Flutter is too much hard', ans: false),
    Question(question: 'Bangladesh is a beautiful country', ans: true),
    Question(question: 'The earth is flat', ans: false),
    Question(question: 'We all are manipulated by someone', ans: true),
    Question(question: 'We can land in sun on night', ans: false),
  ];

  int _questionIndex = 0;

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  void reset(int i) {
    _questionIndex = i;
  }

  int getQuestionIndex() {
    return _questionIndex;
  }

  int getLength() {
    return _questionBank.length;
  }

  String getQuestion() {
    return _questionBank[_questionIndex].question;
  }

  bool getAns() {
    return _questionBank[_questionIndex].ans;
  }

  Future<bool?> showalert(context) {
    return Alert(
      context: context,
      type: AlertType.success,
      title: "WELL DONE!!",
      desc:
          "You reached the last questions, Press Restart button to start again",
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
          },
          width: 120,
          child: const Text(
            "RESTART",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}

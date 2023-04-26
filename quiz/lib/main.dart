import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'progress.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

QuizBrain quizBrain = QuizBrain();
Progress progress = Progress();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> scoreKipper = [];

  void scoreDialogue() {
    setState(() {
      if (quizBrain.getQuestionIndex() == quizBrain.getLength() - 1) {
        quizBrain.showalert(context);
        quizBrain.reset(0);
        progress.clearList();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, padding: EdgeInsets.all(10)),
                  onPressed: () {
                    if (quizBrain.getAns() == true) {
                      setState(() {
                        progress.getWidget(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        progress.getWidget(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                    scoreDialogue();
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red, padding: EdgeInsets.all(10)),
                  onPressed: () {
                    if (quizBrain.getAns() == false) {
                      setState(() {
                        progress.getWidget(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        progress.getWidget(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                    scoreDialogue();
                  },
                  child: const Text('False', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Row(
              children: <Widget>[...progress.showProgress()],
            )
          ],
        ),
      ),
    );
  }
}

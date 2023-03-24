import 'package:flutter/material.dart';
import 'package:quiz/results.dart';
import 'brain.dart';
import 'result.dart';

QuestionBrain mquestionBrain = QuestionBrain();

void main() {
  runApp(MaterialApp(
    home: Quizeapp(),
  ));
}

class Quizeapp extends StatefulWidget {
  Quizeapp({super.key});

  @override
  State<Quizeapp> createState() => _QuizeappState();
}

class _QuizeappState extends State<Quizeapp> {
  List<Widget> iconList = [];
  int _score = 0;

  void checkanswer(bool userchoice) {
    setState(() {
      if (mquestionBrain.isTextFinished()) {
        mquestionBrain.reset();
        _score = 0;
        iconList = [];
      } else {
        if (mquestionBrain.getanswerText() == userchoice) {
          _score += 10;
          iconList.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          iconList.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        print(_score);
        mquestionBrain.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Myapp'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      tooltip: 'Open shopping cart',
                      onPressed: () {
                        // handle the press
                      },
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Text(mquestionBrain.getquestionText()),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () {
                          checkanswer(true);
                        },
                        child: Text('true'),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(4),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/result');
                                checkanswer(false);
                              },
                              child: Text('false'),
                            ))),
                    Expanded(child: Row(children: iconList)),
                  ],
                ),
              ),
            );
          } else if (settings.name == '/result') {
            return MaterialPageRoute(
              builder: (context) => ResultPage(score: _score),
            );
          }
        },
      ),
    );
  }
}

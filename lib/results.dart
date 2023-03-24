import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  ResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Text('Your Score is: $score'),
      ),
    ));
  }
}

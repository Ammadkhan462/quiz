import 'package:quiz/question.dart';

import 'question.dart';
import 'question.dart';

class QuestionBrain {
  int _questionnumber = 0;
  List<Question> _questionlist = [
// ignore: non_constant_identifier_names
    Question(questiontext: 'this is my school ', questoinAnswer: false),
    Question(questiontext: 'this is not school ', questoinAnswer: false),
    Question(questiontext: 'my name is ammad ', questoinAnswer: true),
  ];
  String getquestionText() {
    return _questionlist[_questionnumber].questiontext;
  }

  bool getanswerText() {
    return _questionlist[_questionnumber].questoinAnswer;
  }

  void getNextQuestion() {
    if (_questionnumber < _questionlist.length) {
      _questionnumber++;
    }
  }

  bool isTextFinished() {
    if (_questionnumber >= _questionlist.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionnumber = 0;
  }
}

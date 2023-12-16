import 'dart:developer';

import 'models/question.dart';
import 'data/quiz_data.dart';

class BrainQuiz {
  int index = 0;
  List<Question> questions = [];

  void suroonuToltur() {
    questions.addAll(questionBank);
  }

  void nextQuestion() {
    //print('1 nextQuestion: $index');
    //print('questions.length: ${questions.length}');
    //print('questions.length - 1: ${questions.length - 1}');
    if (index < questions.length - 1) {
      index++;
    }

    log('2 nextQuestion index: $index');
  }

  String showQuestion() {
    log('showQuestion index: $index');
    return questions[index].question;
  }

  getCorrectAnswer() {
    log('getCorrectAnswer index: $index');
    return questions[index].answer;
  }

  bool isFinished() {
    return index == questions.length - 1;

    /* if (index == questions.length - 1) {
      return true;
    } else {
      return false;
    } */
  }

  void restart() {
    index = 0;
  }
}

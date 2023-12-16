import 'package:quiz_riverpod/models/question.dart';
import 'package:quiz_riverpod/data/quiz_data.dart';

class QuizServices {
  int index = 0;
  List<Question> questions = [];

  void suroonuToltur() {
    questions.addAll(questionBank);
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
    }
  }

  String showQuestion() {
    return questions[index].question;
  }

  getCorrectAnswer() {
    return questions[index].answer;
  }

  bool isFinished() {
    return index == questions.length - 1;
  }

  void restart() {
    index = 0;
  }
}

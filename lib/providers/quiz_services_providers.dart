import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:quiz_riverpod/models/client_quiz_model.dart';
import 'package:quiz_riverpod/services/quiz_services.dart';
import 'package:quiz_riverpod/widgets/custom_dialog.dart';

part 'quiz_services_providers.g.dart';

@riverpod
class QuizServicesNotifiers extends _$QuizServicesNotifiers {
  QuizServices quizServices = QuizServices();
  List<Widget> icons = [];

  @override
  ClientQuizModel build() {
    quizServices.init();

    return ClientQuizModel(
      icons: icons,
      question: quizServices.showQuestion(),
    );
  }

  ClientQuizModel setState() {
    return ClientQuizModel(
      icons: icons,
      question: quizServices.showQuestion(),
    );
  }

  void userClicked({
    required BuildContext context,
    required bool usersAnswer,
  }) {
    bool isFinished = quizServices.isFinished();
    bool isCorrect = quizServices.getCorrectAnswer();
    icons.add(buildIcon(
      usersAnswer == isCorrect ? Icons.check : Icons.close,
      usersAnswer == isCorrect ? Colors.green : Colors.red,
    ));

    if (isFinished) {
      icons.clear();
      quizServices.restart();

      showCustomDialog(context, () {
        restart(context);
        Navigator.of(context).pop();
      });
    } else {
      quizServices.nextQuestion();
    }

    state = setState();
  }

  void restart(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget buildIcon(IconData icon, Color color) {
    return Icon(
      icon,
      color: color,
      size: 30,
    );
  }
}

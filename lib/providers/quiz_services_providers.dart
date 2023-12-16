import 'package:quiz_riverpod/models/question.dart';
import 'package:quiz_riverpod/services/quiz_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class QuizServicesNotifiers extends _$QuizServicesNotifiers {
  QuizServices quizServices = QuizServices();

  @override
  List<Question> build() {
    quizServices.suroonuToltur();
  }
}

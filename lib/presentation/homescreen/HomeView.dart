import 'package:examen_flutter/model/answer.dart';
import 'package:examen_flutter/model/question.dart';

abstract class HomeView {
  openAnswerScreen(int position);

  showUsers(List<Question> users);

  showAnswers(List<Answer> answers);


  showLoading();

  hideLoading();

  showError();
}
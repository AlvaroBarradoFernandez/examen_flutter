import 'package:examen_flutter/model/question.dart';

abstract class HomeView {
  openAnswerScreen(int position);

  showUsers(List<Question> users);

  showLoading();

  hideLoading();

  showError();
}
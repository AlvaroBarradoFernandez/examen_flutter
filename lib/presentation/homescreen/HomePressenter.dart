import 'dart:convert';

import 'package:examen_flutter/model/question.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:http/http.dart' as network;

class HomePresenter {
  HomeView _view;

  HomePresenter(this._view);

  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Question> users = jsonBody['results'].map<Question>((element) {
        String question = element['question'];
        return Question(question);
      }).toList();
      _view.showUsers(users);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(int position) {
    _view.openAnswerScreen(position);
  }
}

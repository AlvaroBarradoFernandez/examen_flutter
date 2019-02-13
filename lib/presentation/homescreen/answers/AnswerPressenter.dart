import 'dart:convert';

import 'package:examen_flutter/model/answer.dart';
import 'package:examen_flutter/model/question.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as network;

class AnswerPressenter{
  final int position;
  HomeView _view;

  AnswerPressenter(this.position);

  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Answer> answer = jsonBody['results'].map<Answer>((element) {
        String correct = element['correct_question'];
        String incorrect = element['incorrect_questions'];
        return Answer(correct, incorrect);
      }).toList();
      _view.showAnswers(answer);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }
}

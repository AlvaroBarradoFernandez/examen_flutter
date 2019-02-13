import 'package:examen_flutter/model/answer.dart';
import 'package:examen_flutter/presentation/homescreen/answers/AnswerScreen2.dart';
import 'package:flutter/material.dart';
import 'package:examen_flutter/presentation/homescreen/HomePressenter.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:examen_flutter/presentation/homescreen/answers/AnswerPressenter.dart';
import 'package:examen_flutter/model/question.dart';

class AnswerScreen2 extends StatefulWidget {

  @override
  _AnswerScreen2State createState() => _AnswerScreen2State();
}

class _AnswerScreen2State extends State<AnswerScreen2> implements HomeView {
  AnswerPressenter _answerPressenter;
  List<Answer> _answer = [];
  bool _isLoading = true;
  bool _isError = false;

  _AnswerScreen2State() {
    _answerPressenter = AnswerPressenter(0);
  }

  @override
  void initState() {
    super.initState();
    _answerPressenter.fetchData();
  }

  @override
  openAnswerScreen(int position) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return AnswerScreen2();
    }));
  }

  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }


  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: CircularProgressIndicator(),
          ));
    }
    else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _answerPressenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.help_outline),
              title:
              Text(_answer[position].correctAnswer),
              onTap: () {
                var answerPressenter = _answerPressenter;
              },
            );
          },
          itemCount: _answer.length,
          reverse: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  @override
  showAnswers(List<Answer> answer) {
    setState(() {
      this._answer = answer;
    });
  }

  @override
  showUsers(List<Question> users) {
    // TODO: implement showUsers
    return null;
  }

}
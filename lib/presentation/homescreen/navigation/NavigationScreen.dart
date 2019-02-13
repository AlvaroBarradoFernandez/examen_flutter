import 'package:flutter/material.dart';
import 'package:examen_flutter/presentation/homescreen/HomeScreen.dart';
import 'package:examen_flutter/presentation/homescreen/answers/AnswersScreen.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  HomeScreen _homeScreen = HomeScreen();
  int _currentScreenIndex = 0;

  _getCurrentScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return _homeScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentScreenIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),

          ],
        ),
      ),
      body: _getCurrentScreen(),
    );
  }
}

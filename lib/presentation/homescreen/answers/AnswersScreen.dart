import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  final int position;

  AnswerScreen(this.position);

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail of item ${widget.position}"),),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (c, position) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop(position);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Center(child: Text("Item $position")),
              ),
            ),
          );
        },
      ),
    );
  }
}

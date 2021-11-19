import 'package:flutter/material.dart';
import 'package:tictactoe/game/squares.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20),
        children: const <Widget>[
          Square(),
          Square(),
          Square(),
          Square(),
          Square(),
          Square(),
          Square(),
          Square(),
          Square(),
        ]);
  }
}

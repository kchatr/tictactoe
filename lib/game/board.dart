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
    return Expanded(
      flex: 3,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 210,
        ),
        padding: const EdgeInsets.only(top: 60, left: 360, right: 360),
        children: List.generate(9, (int i) => const Square()),
      ),
    );
  }
}

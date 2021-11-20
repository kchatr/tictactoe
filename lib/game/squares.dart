import 'package:flutter/material.dart';
import 'package:tictactoe/game/player.dart';

class Square extends StatefulWidget {
  const Square({Key? key}) : super(key: key);

  @override
  _SquaresState createState() => _SquaresState();
}

class _SquaresState extends State<Square> {
  String symbol = "-";
  bool playable = true;
  Color? gridCol = Colors.grey[200];

  void play() {
    setState(() {
      symbol = Player.getPlayer() == 1 ? "X" : "O";
      playable = false;
      gridCol = Player.getPlayer() == 1 ? Colors.red[200] : Colors.blue[200];
    });
    Player.updatePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gridCol,
      child: ButtonTheme(
        hoverColor: Colors.pink,
        child: OutlinedButton(
          onPressed: () {
            playable ? play() : null;
          },
          child: Text(
            symbol,
            style: TextStyle(
              color:
                  Player.getPlayer() == 1 ? Colors.red[100] : Colors.blue[100],
            ),
          ),
        ),
      ),
    );
  }
}

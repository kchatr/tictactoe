import 'package:flutter/material.dart';
import 'package:tictactoe/game/player.dart';

class Square extends StatefulWidget {
  const Square({Key? key}) : super(key: key);

  @override
  _SquaresState createState() => _SquaresState();
}

class _SquaresState extends State<Square> {
  String symbol = "";
  bool playable = true;
  Color? gridCol = Colors.grey[50];
  Color? hovCol = Colors.red[50];

  void play() {
    setState(() {
      symbol = Player.getPlayer() == 1 ? "X" : "O";
      playable = false;
      gridCol = Player.getPlayer() == 1 ? Colors.red[200] : Colors.blue[200];
      hovCol = Player.getPlayer() == 1 ? Colors.red[50] : Colors.blue[50];
    });
    Player.updatePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: gridCol,
      child: InkWell(
        onTap: () {
          playable ? play() : null;
        },
        hoverColor: hovCol,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade700, width: 0.2)),
          child: Center(
            child: Text(
              symbol,
              style: TextStyle(
                color: Player.getPlayer() == 1
                    ? Colors.red[100]
                    : Colors.blue[100],
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

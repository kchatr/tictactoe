import 'package:flutter/material.dart';
import 'package:tictactoe/game/player.dart';
import 'package:tictactoe/game/game.dart';

class Square extends StatefulWidget {
  final int? pos;
  const Square({Key? key, @required this.pos}) : super(key: key);

  @override
  _SquaresState createState() => _SquaresState();
}

class _SquaresState extends State<Square> {
  String symbol = "";
  bool playable = Game.getPlayable();
  Color? gridCol = Colors.black87;
  Color? hovCol = Colors.amber[200];

  void gamePlay() {
    if (Game.winner() != 0) {
      Game.setPlayable(false);
    }
  }

  void play() {
    setState(() {
      symbol = Player.getPlayer() == 1 ? "X" : "O";
      playable = false;
      gridCol = Player.getPlayer() == 1 ? Colors.red[200] : Colors.blue[200];
      hovCol = Player.getPlayer() == 1 ? Colors.red[100] : Colors.blue[100];
    });
    Game.updateBoard(widget.pos!, Player.getPlayer());
    gamePlay();
    Player.updatePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: gridCol,
      child: InkWell(
        onTap: () {
          playable ? play() : null;
          if (Game.winner() != 0) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Center(child: Text("${Game.winner() == 1 ? 'X' : 'O'}'s Win!")));
                });
          }
        },
        onHover: (bool i) {
          if (i && playable) {
            setState(() {
              playable = Game.getPlayable();
            });
          }
        },
        hoverColor: playable || symbol != "" ? hovCol : Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 0.3)),
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

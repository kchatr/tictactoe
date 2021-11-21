import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tictactoe/game/player.dart';
import 'package:tictactoe/game/game.dart';

import 'package:confetti/confetti.dart';

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

  late ConfettiController controllerCenterRight;
  late ConfettiController controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
  }

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
                  return Stack(
                    children: [
                      AlertDialog(
                          title: Center(
                              child: Text(
                                  "${Game.winner() == 1 ? 'X' : 'O'}'s Win!"))),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ConfettiWidget(
                          confettiController: controllerCenterRight,
                          blastDirection: pi, // radial value - LEFT
                          particleDrag: 0.01, // apply drag to the confetti
                          emissionFrequency: 0.15, // how often it should emit
                          numberOfParticles: 20, // number of particles to emit
                          gravity: 0.1, // gravity - or fall speed
                          shouldLoop: false, 
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ConfettiWidget(
                          confettiController: controllerCenterLeft,
                          blastDirection: 0,
                          particleDrag: 0.01, // radial value - RIGHT
                          emissionFrequency: 0.15,// set the maximum potential size for the confetti (width, height)
                          numberOfParticles: 20,
                          gravity: 0.1,
                          shouldLoop: false,
                        ),
                      ),
                    ],
                  );
                });
            controllerCenterRight.play();
            controllerCenterLeft.play();
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

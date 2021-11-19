import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  const Square({Key? key}) : super(key: key);

  @override
  _SquaresState createState() => _SquaresState();
}

class _SquaresState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ButtonTheme(
        child: OutlinedButton(
          onPressed: () {},
          child: Text("test"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
const KAppTitle = 'Flutter 2048';
const kMainColor = Colors.blue;

final Map<int, Color> boxColor = <int, Color>{
  2: Colors.yellow[50],
  4: Colors.yellow[100],
  8: Colors.yellow[200],
  16: Colors.yellow[300],
  32: Colors.yellow[400],
  64: Colors.yellow[500],
  128: Colors.yellow[600],
  256: Colors.yellow[700],
  512: Colors.yellow[800],
  1024: Colors.yellow[900],
  2048: Colors.amber[900], 
};

final mainOffColor = Colors.yellow[200];

final dialogTextStyle = TextStyle(color: Colors.white, fontSize: 20);

final backgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.blue, Colors.greenAccent]);

final boxBackground = Color.fromRGBO(96, 125, 139, 0.75); //Colors.blueGrey;

final textColor = Colors.white;

final boxTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: textColor,
);

final buttonGradient = LinearGradient(colors: [
  Color.fromRGBO(116, 116, 191, 1.0),
  Color.fromRGBO(52, 212, 212, 1.0)
]);

final titleTextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: textColor,
);

final cellBoxColor = Color.fromRGBO(207, 216, 220, 0.5);

final borderColor = Color.fromRGBO(96, 125, 139, 0.75);

final EdgeInsets gameMargin = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0);

import 'dart:math';
import 'package:app/dashboard.dart';
import 'package:app/dashboardd.dart';
import 'package:app/main.dart';
import 'package:app/main2.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/boardgridview.dart';
import 'package:app/models/game.dart';
import 'package:app/widgets/cellwidget.dart';
import 'package:app/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:app/models/data.dart';
import 'package:app/constd.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.primary1,

      body: SingleChildScrollView(child: GameWidget()),
      
    );
  }
}

class GameWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GameWidgetState();
  }
}

class GameWidgetState extends State<GameWidget> {
  Game _game;
  MediaQueryData _queryData;
  final int row = 4;
  final int column = 4;
  final double cellPadding = 5.0;
  bool _isDragging = false;
  bool _isGameOver = false; //cause the game is never over!
  int bestScore = 0;

  @override
  void initState() {
    super.initState();
    _readBestScore();
    _game = Game(row, column);
    newGame();
  }

  _readBestScore() async {
    dynamic res = await readScore();
    setState(() {
      bestScore = res;
    });
  }

  void newGame() {
    _game.init();
    _isGameOver = false;
    setState(() {});
  }

  void moveLeft() {
    setState(() {
      _game.moveLeft();
      checkGameOver();
    });
  }

  void moveRight() {
    setState(() {
      _game.moveRight();
      checkGameOver();
    });
  }

  void moveUp() {
    setState(() {
      _game.moveUp();
      checkGameOver();
    });
  }

  void moveDown() {
    setState(() {
      _game.moveDown();
      checkGameOver();
    });
  }

  void checkGameOver() {
    if (_game.isGameOver()) {
      _isGameOver = true;
      String title = "FINISHED";
      int scoreEnd = _game.score;
      if (scoreEnd > bestScore) {
        saveScore(scoreEnd);
        title = "NEW HIGH SCORE !";
        setState(() {
          bestScore = scoreEnd;
        });
      }
      Alert(
        context: context,
        type: AlertType.info,
        title: title,
        desc: "THE GAME IS OVER YOUR SCORE IS $scoreEnd.",
        buttons: [
          DialogButton(
            child: Text(
              "CLOSE",
              style: dialogTextStyle,
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
            color: Colors.amber[600],
          ),
          DialogButton(
            child: Text(
              "NEW GAME",
              style: dialogTextStyle,
              
            ),
            onPressed: () {
              newGame();
              Navigator.pop(context);
            },
            color: Colors.amber[600],
            // gradient: backgroundGradient,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CellWidget> _cellWidget = List<CellWidget>();
    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        _cellWidget.add(CellWidget(cell: _game.get(r, c), state: this));
      }
    }
    _queryData = MediaQuery.of(context);
    List<Widget> children = List<Widget>();
    children.add(BoardGridWidget(this));
    children.addAll(_cellWidget);
    return Container(
      margin: const EdgeInsets.only(
              top: 10.0,
              bottom:0.0,
      ),
      decoration: BoxDecoration(
          color: AppColors.primary1,
        // gradient: backgroundGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   margin: const EdgeInsets.only(
          //     top: 5.0,
          //     bottom:5.0,
          //   ),
          //   child: Text(
          //     // '2048',
          //     '',
          //     style: titleTextStyle,
          //   ),
          // ),
          Container(
             margin: const EdgeInsets.only(
              top: 50.0,
              bottom:5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 15.0,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.amber.shade300,
                    color: AppColors.primary2, 
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Container(
                    width: 300.0,
                    height: 60.0,
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SCORE : '+_game.score.toString(),
                          style: TextStyle(
                            
                            color: AppColors.primary3,
                            fontSize: 25
                          ),
                        ),
                        // Text(
                        //   _game.score.toString(),
                        //   style: boxTextStyle,
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    // color: Colors.amber.shade300,
                    color: AppColors.primary2,
                  ),
                  width: 300.0,
                  height: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'BEST : '+bestScore.toString(),
                        style: TextStyle(
                          color: AppColors.primary3,
                          fontSize: 25
                        ),
                      ),
                      // Text(
                      //   bestScore.toString(),
                      //   style: boxTextStyle,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              FlatButton(
                
                padding: EdgeInsets.only(left: 20, right:80),
                child: Container(
                  width: 80.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    // color: Colors.amber.shade300,
                    color: AppColors.primary2,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.primary3,
                      size: 42,
                    ),
                  ),
                ),
                onPressed: () {
                  if (AppColors.primary4 == 1) {
                    if (AppColors.primary1 == Colors.amber) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));  //newGame();  /////////////////// pass to dashboard
                      AppColors.primary4 = 0;
                  } 
                  else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp2()));  //newGame();  /////////////////// pass to dashboard
                      AppColors.primary4 = 0;
                  }
                  } 
                  else {
                    if (AppColors.primary1 == Colors.amber) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));  //newGame();  /////////////////// pass to dashboard
                    
                  } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboardd()));  //newGame();  /////////////////// pass to dashboard
                
                  }
                  }
                },
              ),
              FlatButton(
                padding: EdgeInsets.only(left: 80, right:20),
                child: Container(
                  width: 80.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    // color: Colors.amber.shade300,
                    color: AppColors.primary2,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.rotate_left_outlined,
                      color: AppColors.primary3,
                      size: 42,
                    ),
                  ),
                ),
                onPressed: () {
                  newGame();
                },
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                
              ),
              margin: gameMargin,
              width: boardSize().width, //_queryData.size.width,
              height: _queryData.size.width,
              child: GestureDetector(
                onVerticalDragUpdate: (detail) {
                  if (detail.delta.distance == 0 || _isDragging) {
                    return;
                  }
                  _isDragging = true;
                  if (detail.delta.direction > 0) {
                    moveDown();
                  } else {
                    moveUp();
                  }
                },
                onVerticalDragEnd: (detail) {
                  _isDragging = false;
                },
                onVerticalDragCancel: () {
                  _isDragging = false;
                },
                onHorizontalDragUpdate: (detail) {
                  if (detail.delta.distance == 0 || _isDragging) {
                    return;
                  }
                  _isDragging = true;
                  if (detail.delta.direction > 0) {
                    moveLeft();
                  } else {
                    moveRight();
                  }
                },
                onHorizontalDragDown: (detail) {
                  _isDragging = false;
                },
                onHorizontalDragCancel: () {
                  _isDragging = false;
                },
                child: Stack(
                  children: children,
                ),
              )),
        ],
      ),
    );
  }

  Size boardSize() {
    assert(_queryData != null);
    Size size = _queryData.size;
    num width = size.width - gameMargin.left - gameMargin.right;
    double ratio = size.width / size.height;
    if (ratio > 0.75) {
      width = size.height / 2;
    }
    return Size(width, width);
  }
}

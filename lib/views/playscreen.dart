import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/views/finalscreen.dart';

import '../widgets/grid.dart';

// This file implements the game logic and play screen of the project that is responsible for 
// core gameplay.

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
 
  var _currentTurn;                                             // Is set to 0 for O's turn and to 1 for X's turn.
  bool oWins = false;                                           
  bool xWins = false;


  // This function is called by this._checkwinner function. 
  // It navigates to the final game screen along with information about the game outcome.

  void _endTheGame(BuildContext ctx, int winner){
    var outComeMap = {
      -1 : "Draw",
      0 : "O",
      1 : "X",
    };
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return FinalScreen(outComeMap[winner]);
        }
      )
    );
  }
  
  // Initialises the grid pattern with empty cell values denoted by -1. 
  final List<List <int> >_currentPattern = [
    [-1, -1, -1],
    [-1, -1, -1],
    [-1, -1, -1]
  ];

  // This function initialises the state of the play screen by randomly choosing the starting player.
  @override
  void initState() {
    var rn = Random();
    this._currentTurn = rn.nextInt(2);
    super.initState();
    rn = null;
  }

  // This function checks for winner after every modification to the this._currentPattern.

  void _checkwinner(BuildContext ctx){

    bool hasEmptyCell = false;
    
    // Checks for draw.
    for (int i=0; i<3; i++) for(int j=0; j<3; j++)  if(this._currentPattern[i][j] == -1){hasEmptyCell = true; break; }
    if(!hasEmptyCell) this._endTheGame(ctx, -1);

    // Checks for winning pattern in rows. 
    for(int i=0; i<3; i++){

      // Checks rows for X's winning patter i.e. [1, 1, 1, ]
      for(int j= 0; j<3; j++) if(this._currentPattern[i][j] != 1){ xWins = false;  break;} else xWins = true;
      if(xWins) this._endTheGame(ctx, 1);

      // Checks rows for O's winning pattern i.e. [0, 0, 0,]
      for(int j= 0; j<3; j++) if(this._currentPattern[i][j] != 0){ oWins = false;  break;} else oWins = true;
      if(oWins) this._endTheGame(ctx, 0);
    }


    // Checks columns for winning patterns.
    for(int i=0; i<3; i++){

      // Checks columns for X's winning pattern.
      for(int j= 0; j<3; j++) if(this._currentPattern[j][i] != 1){ xWins = false;  break;} else xWins = true;
      if(xWins) this._endTheGame(ctx, 1);

      // Checks columns for O's winning pattern.
      for(int j= 0; j<3; j++) if(this._currentPattern[j][i] != 0){ oWins = false;  break;} else oWins = true;
      if(oWins) this._endTheGame(ctx, 0);
    }

    // Checks prime diagonal for X's winning pattern.
    for(int j= 0; j<3; j++) if(this._currentPattern[j][j] != 1){ xWins = false;  break;} else xWins = true;
    if(xWins) this._endTheGame(ctx, 1);

    // Checks prime diagonal for O's winning pattern.
    for(int j= 0; j<3; j++) if(this._currentPattern[j][j] != 0){ oWins = false;  break;} else oWins = true;
    if(oWins) this._endTheGame(ctx, 0);

    // Checks second diagonal for X's winning pattern.
    for(int j= 0; j<3; j++) if(this._currentPattern[j][2-j] != 1){ xWins = false;  break;} else xWins = true;
    if(xWins) this._endTheGame(ctx, 1);
    
    // Checks second diagonal for O's winning pattern.
    for(int j= 0; j<3; j++) if(this._currentPattern[j][2-j] != 0){ oWins = false;  break;} else oWins = true;
    if(oWins) this._endTheGame(ctx, 0);

  }


  // Modifies the grid cell on a tap action on an empty cell
  // Thereafter changes the player turn.
  void _playTurn(BuildContext ctx, int i, int j){

    // Check if a winner is already found.
    if(oWins || xWins)  return;

    // Checks if this grid cell is empty, does not change state if cell is occupied already.
    if(_currentPattern[i][j] != -1)
      return;

    // Assigns new value to the specified grid cell and changes the player turn.
    setState(() {
      _currentPattern[i][j] = _currentTurn;
      _currentTurn = (_currentTurn+1)%2;
    });

    // Calls for checking of a winning pattern. 
    this._checkwinner(ctx);
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            // Helps align the widgets that follow to the centre of screen
            Flexible(
              flex: 1,
              child: SizedBox(height: MediaQuery.of(context).size.height*0.1,)
            ),
            
            // Displays the player cue box for player 'X'.
            Flexible(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.75,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: this._currentTurn == 1 ?  Colors.blueAccent : Theme.of(context).backgroundColor, 
                        style: BorderStyle.solid, width: 15
                      ) 
                  ),
                  padding : EdgeInsets.all(15),
                  child: Text(
                    "X",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
              ),
            ),
            
            // Displays the Play area or the grid. Implementer in '../widgets/grid.dart'
            Flexible(
              flex: 4,
              child: GridPattern(this._currentPattern, this._playTurn)
            ),
            
            // Displays player cue box for the player 'O'.
            Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width*0.75,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: this._currentTurn == 0 ?  Colors.blueAccent : Theme.of(context).backgroundColor, 
                        style: BorderStyle.solid, width: 15
                      ) 
                  ),
                padding: EdgeInsets.all(15),
                child: Text(
                  "O",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  
  
  }
}
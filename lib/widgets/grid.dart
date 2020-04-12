import 'package:flutter/material.dart';

import './gridcell.dart';

// Implements the grid or play area of the game. 
// Used in ../views/playscreen.dart

class GridPattern extends StatelessWidget {
  
  final List<List<int>> currentPattern;                        // The current state of the playboard. -1 for empty cell. 1 for X. 0 for O.
  final Function _playTurn;                                    // Function call to the state changing fucntion in playscreen in case of tap event.

  GridPattern(this.currentPattern, this._playTurn);


  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        children: <Widget>[
          GridCell(currentPattern[0][0],0,0,this._playTurn),
          GridCell(currentPattern[0][1],0,1,this._playTurn),
          GridCell(currentPattern[0][2],0,2,this._playTurn),
          GridCell(currentPattern[1][0],1,0,this._playTurn),
          GridCell(currentPattern[1][1],1,1,this._playTurn),
          GridCell(currentPattern[1][2],1,2,this._playTurn),
          GridCell(currentPattern[2][0],2,0,this._playTurn),
          GridCell(currentPattern[2][1],2,1,this._playTurn),
          GridCell(currentPattern[2][2],2,2,this._playTurn),
        ],

        // See course's section 7 notes for more info on this.
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
            childAspectRatio: 1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
        ),

      ),
    );
  }
}
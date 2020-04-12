import 'package:flutter/material.dart';

// Implements the basic grid cell used for construction of the entire grid widget. 
// Used in './grid.dart'

class GridCell extends StatelessWidget {
  
  final int _currentMode;                                     // Current state of this cell.
  final int i, j;                                             // The indices of the _currentPattern element corresponding to this cell
  final Function _playTurn;                                   // Function call in case of a tap event. Used in FlatButton widget. See below.
  
  GridCell(this._currentMode, this.i, this.j, this._playTurn);

  @override
  Widget build(BuildContext context) {
    Widget textChild;
    if(this._currentMode == -1)
      textChild =  Text(' ', style: TextStyle(fontSize: 40),);
    else if(this._currentMode == 0)
       textChild = Text('O', 
       style: TextStyle(
         fontSize: 40, 
         fontWeight: FontWeight.w300
        ),
      );
    else
      textChild =  Text('X', 
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w300
      ),
    );

    // Returns cell as a FlatButton
    return Expanded(
      child: Container(
        
        // Decoration on the Grid Cell.
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, 
              color: Colors.black54, 
              style: BorderStyle.solid
            ),
        ),

        // The actual grid cell. 
        child: FlatButton(
          onPressed: () {
          this._playTurn(context,i,j);
          }, 
          
          child: Expanded(child: textChild,)
        ),
      ),
    );
  }
}

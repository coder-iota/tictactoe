import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  final int _currentMode;

  GridCell(this._currentMode);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Colors.black54, style: BorderStyle.solid),
        ),
        child: FlatButton(onPressed: () {}, 
          child: Expanded(
            child: Text('X', style: TextStyle(fontSize: 40),)
          )
        ),
      ),
    );
  }
}

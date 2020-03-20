import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {

  final int _currentMode;

  GridCell(this._currentMode);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){}, 
      child: Text('-')
    );
  }
}
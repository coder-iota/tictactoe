import 'package:flutter/material.dart';

import './gridcell.dart';

class GridPattern extends StatefulWidget {
  @override
  _GridPatternState createState() => _GridPatternState();
}

class _GridPatternState extends State<GridPattern> {
  
  final _currentPattern = [[-1,-1,-1], [-1,-1,-1], [-1,-1,-1]];
  



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget> [
              GridCell(_currentPattern[0][0]),
              GridCell(_currentPattern[0][1]),
              GridCell(_currentPattern[0][2]),
            ]
          ),
          Row(
            children: <Widget> [
              GridCell(_currentPattern[1][0]),
              GridCell(_currentPattern[1][1]),
              GridCell(_currentPattern[1][2]),
            ]
          ),
          Row(
            children: <Widget> [
              GridCell(_currentPattern[2][0]),
              GridCell(_currentPattern[2][1]),
              GridCell(_currentPattern[2][2]),
            ]
          ),
        ],
      )
    );
  }
}
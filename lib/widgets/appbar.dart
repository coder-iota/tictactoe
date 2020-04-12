import 'package:flutter/material.dart';

class TicTacToeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title : const Text('Tic Tac Toe'),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
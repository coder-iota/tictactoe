import 'package:flutter/material.dart';

import './playscreen.dart';
import './homescreen.dart';

// This displays the final screen of the game, can also be called the outcome screen.
// This screen is constructed using the data obtained as the match outcome via the play screen.

class FinalScreen extends StatelessWidget {

  final String winner;                                   // Stores the match outcome.

  FinalScreen(this.winner);

  // Restarts the game.
  // Should be used for 'onTap' action for the replay gesture detector or 'Play again' button. Either directly or indirectly.
  void _restartTheGame(BuildContext ctx){
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return PlayScreen();
        }
      )
    );
  }


  // Takes the game back to Home screen.
  // Should be used for 'onTap' action for the home gesture detector or 'Home' button. Either directly or indirectly. 
  void _goToHome(BuildContext ctx){
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return HomeScreen();
        }
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // The app bar that is implemented here can be and preferably should be modified to a better styled app bar
      // that is implemented as an independent widget, to be reused in home screen.


      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Theme.of(context).primaryColor,
      ),


      body: Column(
        children: <Widget>[

          // Displays the match outcome.
          // Should be implemented using improved UI.
          Flexible(
            flex: 2,
            child: Text(this.winner == 'Draw' ? 'This match is a DRAW !' : ('Place your content here.\nThe Winner is ' + this.winner))
          ),

          // The play again button.
          // Should be replaced by an Icon button or a Gesture detector on an Image widget.
          Flexible(
            flex : 1,
            child: Center(
              child: RaisedButton(
                onPressed: () => this._restartTheGame(context),
                child: Text('Play Again'),
              )
            )
          ),

          // The home button.
          // Should be replaced by an Icon button or a Gesture detector on an Image widget.
          Flexible(
            flex : 1,
            child: Center(
              child: RaisedButton(
                onPressed: () => this._goToHome(context),
                child: Text('Home Screen'),
              )
            )
          )
        ],
      ),
    );
  }
}

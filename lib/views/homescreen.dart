import 'package:flutter/material.dart';

import './playscreen.dart';

// This class returns the initial view of the project that contains basic UI and a play button. 


class HomeScreen extends StatelessWidget {

  // This function changes the currently displayed screen to the game screen. 
  // DO NOT MODIFY IT WITHOUT CONSULTING!
  void _startTheGame(BuildContext ctx){
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return PlayScreen();
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // The app bar that is implemented here can be and preferably should be modified to a better styled app bar
      // that is implemented as an independent widget, to be reused in final screen.

      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Theme.of(context).primaryColor,
      ),

      // Body of this Scaffold should be modified to improve the UI and to better adapt to the more general Theme of the project.
      
      // Also remember that the 'onTap' property on the button that initialises the play must always call the this._startTheGame(context)
      // either directly or through function stack to enable navigation to the play screen. 

      body: Column(
        children: <Widget>[
          Flexible(
             flex: 1,
            child: Text('Insert your content here.')
          ),
          Flexible(
            flex : 1,
            child: Center(
                child: RaisedButton( 
                onPressed: () => this._startTheGame(context), 
                child: Text('PLAY BUTTON') 
              ),
            ),
          )
        ],
      ),
    );
  }
}
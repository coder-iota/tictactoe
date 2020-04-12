import 'package:flutter/material.dart';
import './views/homescreen.dart';

void main() => runApp(MyApp());

// This is the start of the project. 
// Homescreen is implemented in ./views/homescreen.dart
// The game logic and play screen are implemented in ./views/playscreen.dart
// The final screen that displays the games outcome is implemented in the ./views/finalscreen.dart

// Widgets that are complex enough should be implemented in independent files that should be stored in ./widgets directory
// Currently available and implemented widgets are
    
//     *Grid widget : For play screen grid
//     *GridCell widget : To construct the Grid
//   (Please append to this list if you add any further widget files) 

// Other information about various views and widgets can be found in README.md and their respective files. 


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


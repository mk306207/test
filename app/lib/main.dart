import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  randomColor - variable to store the current random color, initialized to white, color of the background
  randomRed, randomGreen, randomBlue - variables to store the individual RGB components of the random color, initialized to 255 (white)
  */
  var randomColor = Color.fromARGB(255, 255, 255, 255); 
  final random = Random();
  var randomRed = 255;
  var randomGreen = 255;
  var randomBlue = 255;

  // Function to generate a new random color when the screen is touched
  void _screenTouched() {
    setState(() {
      randomRed = random.nextInt(256);
      randomGreen = random.nextInt(256);
      randomBlue = random.nextInt(256);

      randomColor = Color.fromARGB(255, randomRed, randomGreen, randomBlue);
    });
  }
  /* Function to invert the color for better visibility of text and button
  It takes a Color object as input and returns a new Color object with inverted RGB values
  */
  Color _invertColor(Color color) {
      Color newcolor = Color.fromARGB(
        255,
        255 - randomRed,
        255 - randomGreen,
        255 - randomBlue
      );
      return newcolor;
  }

  // Function to reset the color back to white when the button is pressed
  void _resetColor() {
    setState(() {
      randomRed = 255;
      randomGreen = 255;
      randomBlue = 255;
      randomColor = Color.fromARGB(255, randomRed, randomGreen, randomBlue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: randomColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _screenTouched,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [            
            Text(
              'Hello there',
              style: TextStyle(
                color: _invertColor(randomColor),
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
              ),
            TextButton(
              onPressed: _resetColor, 
              style: TextButton.styleFrom(
                backgroundColor: _invertColor(randomColor),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Reset Color',
                style: TextStyle(
                  color: randomColor,
                  fontSize: 20,
                ),
              )
            )
            ],)

        ),
      ),
    );
  }
}

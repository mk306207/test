import 'dart:math';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
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
  randomColor - variable to store the current random color, initialized 
  to white, color of the background
  randomRed, randomGreen, randomBlue - variables to store the individual RGB 
  components of the random color, initialized to 255 (white)
  */
  Color randomColor = const Color.fromARGB(255, 255, 255, 255); 
  final random = Random();
  int randomRed = 255;
  int randomGreen = 255;
  int randomBlue = 255;
  int poolOfColors = 256; /* Variable to avoid magic number, 
  represents the number of possible values for each RGB component (0-255) */
  int whiteColor = 255; /* Variable to avoid magic number, 
  represents the value for white color */

  // Function to generate a new random color when the screen is touched
  void _screenTouched() {
    setState(() {
      randomRed = random.nextInt(poolOfColors);
      randomGreen = random.nextInt(poolOfColors);
      randomBlue = random.nextInt(poolOfColors);

      randomColor = Color.fromARGB(whiteColor, randomRed, randomGreen,
       randomBlue);
    });
  }
  /* Function to invert the color for better visibility of text and button
  It takes a Color object as input and returns 
  a new Color object with inverted RGB values
  */
  Color _invertColor() {
      final Color newcolor = Color.fromARGB(
        whiteColor,
        whiteColor - randomRed,
        whiteColor - randomGreen,
        whiteColor - randomBlue
      );

      return newcolor;
  }

  // Function to reset the color back to white when the button is pressed
  void _resetColor() {
    setState(() {
      randomRed = whiteColor;
      randomGreen = whiteColor;
      randomBlue = whiteColor;
      randomColor = Color.fromARGB(whiteColor, randomRed, randomGreen,
       randomBlue);
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [            
            Text(
              'Hello there',
              style: TextStyle(
                color: _invertColor(),
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
              ),
            TextButton(
              onPressed: _resetColor, 
              style: TextButton.styleFrom(
                backgroundColor: _invertColor(),
                padding: const EdgeInsets.symmetric(horizontal: 20,
                 vertical: 10),
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

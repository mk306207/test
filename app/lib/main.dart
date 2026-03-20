import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var randomColor = Color.fromARGB(255, 255, 255, 255);
  final random = Random();
  var randomRed = 255;
  var randomGreen = 255;
  var randomBlue = 255;

  void _screenTouched() {
    setState(() {
      randomRed = random.nextInt(256);
      randomGreen = random.nextInt(256);
      randomBlue = random.nextInt(256);

      randomColor = Color.fromARGB(255, randomRed, randomGreen, randomBlue);
    });
  }

  Color _invertColor(Color color) {
      Color newcolor = Color.fromARGB(
        255,
        255 - randomRed,
        255 - randomGreen,
        255 - randomBlue
      );
      return newcolor;
  }

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
              ),),
            TextButton(
              onPressed: _resetColor, 
              child: Text('Reset Color'))
            ],)

        ),
      ),
    );
  }
}

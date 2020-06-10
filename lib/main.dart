import 'dart:math';

import 'package:dicee/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Dicee'),
      ),
      body: Container(
        child: Center(
          child: Row(
            children: [
              Die(
                image: 'images/dice$leftDiceNumber.png',
                onPressed: () {
                  changeDiceFace();
                },
              ),
              Die(
                image: 'images/dice$rightDiceNumber.png',
                onPressed: () {
                  changeDiceFace();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Die extends StatelessWidget {
  const Die({@required this.onPressed, @required this.image});

  final Function onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: this.onPressed,
        child: Image.asset(this.image),
      ),
    );
  }
}

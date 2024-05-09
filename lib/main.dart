import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RollDice();
  }
}

var currentroll = 1;
var randomize = Random();

class RollDice extends StatefulWidget {
  @override
  State<RollDice> createState() {
    return _rollDicestate();
  }
}

class _rollDicestate extends State<RollDice> {
  void imageShow() {
    setState(() {
      currentroll = randomize.nextInt(6) + 1;
    });
  }

  void cancle() {
    setState(() {
      currentroll = 7;
    });
  }

  void forsix() {
    setState(() {
      currentroll = 6;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Dice Roller..',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.disabled_by_default_rounded),
                color: Colors.white,
                onPressed: cancle,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/dice-$currentroll.png'),
                width: 200,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: imageShow,
                child: Text(
                  'Roll It',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(height: 200),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                  child: TextButton(
                onPressed: forsix,
                child: Text(
                  '00',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _diceList = <String>[
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  int _index1 = 0,
      _index2 = 0,
      _diceSum = 0,
      _point = 0;
  final _random = Random.secure();
  bool _hasGameStarted = false;
  bool _isGameOver = false;
  String _statusMsg = 'YOU LOST';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Dice Game'),
        centerTitle: true,
      ),
      body: Center(
        child: _hasGameStarted ? _gameSection() : _startGameSection(),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.blue,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (
          Text('© Next Digit',style: TextStyle(fontSize: 30),)
          ),
        ),
      ),
    );
  }

  Widget _startGameSection() {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
        setState(() {
          _hasGameStarted = true;
        });
      }, child: const Text('START'),
      ),
    );
  }

  Widget _gameSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_diceList[_index1], width: 100, height: 100,),
            const SizedBox(width: 5,),
            Image.asset(_diceList[_index2], width: 100, height: 100,),
          ],
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: _isGameOver ? null : _rollTheDice,
            child: const Text('ROLL'),
          ),
        ),
        const SizedBox(height: 10,),
        Text('Dice Sum: $_diceSum',
          style: TextStyle(
              fontSize: 22),
        ),
        const SizedBox(height: 10,),
        if (_point > 0 )
          Text('Your point: $_point',
          style: TextStyle(
            fontSize: 22,
            color: Colors.green,),
        ),
        const SizedBox(height: 10,),
        if (_point > 0 && !_isGameOver)
          Text('Keep rolling until you match your point  $_point',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,backgroundColor: Colors.amber),
        ),
        const SizedBox(height: 10,),
        if (_isGameOver)
          Text(_statusMsg,
          style: TextStyle(
              fontSize: 18,
              color: Colors.black),
        ),
        const SizedBox(height: 10,),
        if (_isGameOver)
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
            onPressed: _resetGame,
            child: const Text('PLAY AGAIN'),
        ),
          ),
      ],
    );

  }


  void _rollTheDice() {
    setState(() {
      _index1 = _random.nextInt(6);
      _index2 = _random.nextInt(6);
      _diceSum = _index1 + _index2 + 2;
      if(_point > 0) {
        _checkSecondThrow();
      } else {
        _checkFirstThrow();
      }
    });
  }


  void _checkFirstThrow() {
    switch(_diceSum) {
      case 7:
      case 11:
        _statusMsg = 'You Win!!!';
        _isGameOver = true;
        break;
      case 2:
      case 3:
      case 12:
        _statusMsg = 'You Loost!!!';
        _isGameOver = true;
        break;
      default:
        _point = _diceSum;
        break;
    }
  }


  void _checkSecondThrow() {
    if(_diceSum == _point) {
      _statusMsg = 'You Win!!!';
      _isGameOver = true;
    } else if (_diceSum == 7) {
      _statusMsg = 'You Lost!!!';
      _isGameOver = true;
    }
  }


  void _resetGame() {
    setState(() {
      _index1 = 0;
      _index2 = 0;
      _diceSum = 0;
      _point = 0;
      _isGameOver = false;
      _hasGameStarted = false;
    });
  }
}
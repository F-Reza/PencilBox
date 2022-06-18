import 'dart:math';

import 'package:flutter/material.dart';

class HomePageOne extends StatefulWidget {
  const HomePageOne({Key? key}) : super(key: key);

  @override
  State<HomePageOne> createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
  final _diceList = <String>[
    'images/d1.PNG',
    'images/d2.PNG',
    'images/d3.PNG',
    'images/d4.PNG',
    'images/d5.PNG',
    'images/d6.PNG',
  ];
  int _index1 = 0, _index2 = 0, _diceSum = 0, _point = 0;
  final _random = Random.secure();
  bool _hasGameStarted = false;
  bool _isGameOver = false;
  String _statusMsg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Dice Game'),
      ),
      body: Center(
        child: _hasGameStarted ? _gameSection() : _startGameSection(),
      ),
    );
  }

  Widget _startGameSection() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _hasGameStarted = true;
        });
      },
      child: const Text('START'),
    );
  }

  Widget _gameSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _diceList[_index1],
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              _diceList[_index2],
              width: 100,
              height: 100,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _isGameOver ? null : _rollTheDice,
          child: const Text('ROLL'),
        ),
        Text(
          'Dice Sum: $_diceSum',
          style: TextStyle(fontSize: 22),
        ),
        if(_point > 0) Text(
          'Your Point: $_point',
          style: TextStyle(fontSize: 26, color: Colors.green),
        ),
        if(_point > 0 && !_isGameOver)const Text(
          'Keep rolling until you match your point',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            backgroundColor: Colors.black45,
          ),
        ),
        if(_isGameOver) Text(
          _statusMsg,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        if(_isGameOver) ElevatedButton(
          onPressed: _resetGame,
          child: const Text('PLAY AGAIN'),
        )
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
      _statusMsg = 'You Lost!!!';
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

import 'dart:async';

import 'package:final_project/pong/controller/pong_controller.dart';
import 'package:final_project/pong/models/ball.dart';
import 'package:flutter/material.dart';

import '../models/paddle.dart';

class PongScreen extends StatefulWidget {
  const PongScreen({Key? key, required Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  State<PongScreen> createState() => _PongScreenState();
}

class _PongScreenState extends State<PongScreen> {
  late final PongController _controller;
  late Timer _timer;
  bool _isOn = false;
  double _playerDx = 0;

  @override
  void initState() {
    _controller = PongController(size: widget._size);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Timer _timerInit() => Timer.periodic(
        Duration(milliseconds: (1000 / 60).ceil()),
        (timer) {
          setState(
            () {
              _controller.move(_playerDx);
            },
          );
        },
      );

  _onPlayPause() {
    setState(() {
      _isOn = !_isOn;
      if (_isOn) {
        _timer = _timerInit();
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pong'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: widget._size.height,
            width: widget._size.width,
            child: Stack(
              children: [
                Positioned(
                  left: _controller.botPaddle.left,
                  top: _controller.botPaddle.paddleY,
                  child: Hero(
                    tag: 'Pong paddle',
                    child: Container(
                      height: Paddle.paddleHeight,
                      width: Paddle.paddleWidth,
                      color: (_isOn) ? Colors.white : theme.colorScheme.primary,
                    ),
                  ),
                ),
                Positioned(
                  left: _controller.playerPaddle.left,
                  top: _controller.playerPaddle.paddleY,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        _playerDx = details.delta.dx;
                        _controller.playerPaddle.movePaddle(_playerDx);
                        _playerDx = 0;
                      });
                    },
                    child: Container(
                      height: Paddle.paddleHeight,
                      width: Paddle.paddleWidth,
                      color: (_isOn) ? Colors.white : theme.colorScheme.primary,
                    ),
                  ),
                ),
                Positioned(
                  left: _controller.ball.left,
                  top: _controller.ball.top,
                  child: Container(
                    height: Ball.ballSize,
                    width: Ball.ballSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_isOn) ? Colors.white : theme.colorScheme.primary,
                    ),
                  ),
                ),
                Positioned(
                  height: 100,
                  left: widget._size.width - 50,
                  top: widget._size.height / 2 - 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _controller.botScore.toString(),
                        style: theme.textTheme.displayLarge,
                      ),
                      IconButton(
                        onPressed: _onPlayPause,
                        splashRadius: 20,
                        icon: Icon(
                          (_isOn) ? Icons.pause : Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                      Text(
                        _controller.playerScore.toString(),
                        style: theme.textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

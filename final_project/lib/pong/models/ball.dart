import 'dart:math';
import 'dart:ui';

import 'package:final_project/pong/models/paddle.dart';

class Ball {
  static const double ballSize = 20;
  static const double ballSpeed = 5;
  final Size _screenSize;

  late double _ballX;
  late double _ballY;
  late double _ballDx;
  late double _ballDy;

  Ball(Size screenSize) : _screenSize = screenSize {
    initBall();
  }

  initBall() {
    _ballX = (_screenSize.width - ballSize) / 2;
    _ballY = (_screenSize.height - ballSize) / 2;
    bool moveUp = Random().nextBool();
    int angel = 45 + Random().nextInt(91);
    _ballDx = ballSpeed * sin(_angelToRadians((angel - 90).abs()));
    _ballDy = ballSpeed * cos(_angelToRadians((angel - 90).abs()));
    if (!moveUp) {
      _ballDx = -_ballDx;
    }
    if (angel < 90) {
      _ballDy = -_ballDy;
    }
  }

  double _angelToRadians(int angel) => angel * pi / 180;

  moveBall() {
    _ballX += _ballDx;
    _ballY += _ballDy;
    _ballDx += (_ballDx < 0) ? -0.001 : 0.001;
    _ballDy += (_ballDy < 0) ? -0.001 : 0.001;
  }

  setCollisions(bool xCollision, int yCollision) {
    if (xCollision) {
      if (left <= 0) {
        _ballX = 0;
      } else {
        _ballX = _screenSize.width - ballSize;
      }
      _ballDx = -_ballDx;
    }
    if (yCollision != 0) {
      print(yCollision);
      _ballY = (_ballY < _screenSize.height / 2)
          ? Paddle.paddleHeight
          : _ballY = _screenSize.height - Paddle.paddleHeight - ballSize;
      _ballDx += yCollision;
      _ballDy = -_ballDy;
    }
  }

  double get top => _ballY;

  double get bottom => _ballY + ballSize;

  double get left => _ballX;

  double get center => _ballX + ballSize / 2;

  double get right => _ballX + ballSize;
}

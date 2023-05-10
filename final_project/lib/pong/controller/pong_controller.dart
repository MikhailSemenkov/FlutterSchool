import 'dart:math';
import 'dart:ui';

import '../models/ball.dart';
import '../models/paddle.dart';

class PongController {
  static const double _botSpeed = 10;

  final Size _size;
  late final Ball _ball;
  late final Paddle _playerPaddle;
  late final Paddle _botPaddle;

  int _playerScore = 0;
  int _botScore = 0;

  PongController({required Size size}) : _size = size {
    _ball = Ball(_size);
    _playerPaddle = Paddle(
      screenWidth: _size.width,
      paddleX: (_size.width - Paddle.paddleWidth) / 2,
      paddleY: _size.height - Paddle.paddleHeight,
    );
    _botPaddle = Paddle(
      screenWidth: _size.width,
      paddleX: (_size.width - Paddle.paddleWidth) / 2,
      paddleY: 0,
    );
  }

  move(double playerDx) {
    _playerPaddle.movePaddle(playerDx);
    double botDx = ball.center - botPaddle.center;
    botDx = min(botDx.abs(), _botSpeed) * ((botDx < 0) ? -1 : 1);
    _botPaddle.movePaddle(botDx);
    _ball.moveBall();
    _ball.setCollisions(_wallCollision(), _paddleCollision());
  }

  bool _wallCollision() {
    if (ball.left <= 0 || ball.right >= _size.width) {
      return true;
    }
    if (ball.top <= 0) {
      _playerScore++;
      ball.initBall();
    } else if (ball.bottom >= _size.height) {
      _botScore++;
      ball.initBall();
    }
    return false;
  }

  int _paddleCollision() {
    if (ball.bottom >= playerPaddle.paddleY &&
        (ball.center >= playerPaddle.left &&
            ball.center <= playerPaddle.right)) {
      return playerPaddle.moved;
    } else if (ball.top <= botPaddle.paddleY + Paddle.paddleHeight &&
        (ball.center >= botPaddle.left && ball.center <= botPaddle.right)) {
      return botPaddle.moved;
    }
    return 0;
  }

  int get playerScore => _playerScore;

  int get botScore => _botScore;

  Ball get ball => _ball;

  Paddle get playerPaddle => _playerPaddle;

  Paddle get botPaddle => _botPaddle;
}

class Paddle {
  static const double paddleHeight = 20;
  static const double paddleWidth = 70;

  final double _screenWidth;

  int _paddleMoved = 0;
  double _paddleX;
  double _paddleY;

  Paddle(
      {required double screenWidth,
      required double paddleX,
      required double paddleY})
      : _screenWidth = screenWidth,
        _paddleX = paddleX,
        _paddleY = paddleY;

  movePaddle(double dx) {
    _paddleMoved = (dx > 0) ? 1 : -1;
    _paddleX += dx;
    if (_paddleX < 0) {
      _paddleX = 0;
    }
    if (_paddleX > _screenWidth - paddleWidth) {
      _paddleX = _screenWidth - paddleWidth;
    }
  }

  double get left => _paddleX;

  double get center => _paddleX + paddleWidth / 2;

  double get right => _paddleX + paddleWidth;

  double get paddleY => _paddleY;

  int get moved => _paddleMoved;
}

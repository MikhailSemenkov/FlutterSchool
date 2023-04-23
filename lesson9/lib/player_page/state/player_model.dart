import 'dart:async';

import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  bool _isPlaying = false;
  bool _isFavorite = false;
  double _passedTime = 0;
  Timer? _timer;

  Timer _timerInit() => Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          _incrementTime();
        },
      );

  void playPressed() {
    _isPlaying = !_isPlaying;
    if (_isPlaying) {
      _timer = _timerInit();
    } else {
      _timer?.cancel();
    }
    notifyListeners();
  }

  void _incrementTime() {
    _passedTime++;
    notifyListeners();
  }

  void resetTime() async {
    _passedTime = 0;
    _timer?.cancel();
    await Future.delayed(const Duration(milliseconds: 500), () {});
    notifyListeners();
    _timer = _timerInit();
  }

  void favoritePressed() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  bool get isFavorite => _isFavorite;

  bool get isPlaying => _isPlaying;

  double get passedTime => _passedTime;

  set passedTime(double value) {
    _passedTime = value;
    notifyListeners();
  }
}

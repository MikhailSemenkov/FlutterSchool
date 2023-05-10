import 'package:flutter/animation.dart';

class PlayerTransitionCurve extends Curve {
  @override
  double transformInternal(double t) {
    return (t < 0.85) ? 0 : t;
  }
}

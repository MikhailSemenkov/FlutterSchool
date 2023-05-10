import 'package:flutter/material.dart';

class ProfileBackgroundPainter extends CustomPainter {
  final Color _color;

  ProfileBackgroundPainter(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 50,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    Paint paint = Paint()..color = _color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

import 'dart:math';

import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint();
    circlePaint.color = const Color(0xFF1db954);
    canvas.drawCircle(const Offset(0, 0), 100, circlePaint);

    canvas.rotate(_angelToRadians(7));

    Paint pathPaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18;
    Rect drawingRect =
        Rect.fromCircle(center: const Offset(0, 155), radius: 190);
    canvas.drawArc(drawingRect, _angelToRadians(251), _angelToRadians(38),
        false, pathPaint);

    pathPaint.strokeWidth = 13;
    drawingRect = Rect.fromCircle(center: const Offset(0, 160), radius: 162);
    canvas.drawArc(drawingRect, _angelToRadians(250), _angelToRadians(39),
        false, pathPaint);

    pathPaint.strokeWidth = 12;
    drawingRect = Rect.fromCircle(center: const Offset(0, 155), radius: 127);
    canvas.drawArc(drawingRect, _angelToRadians(248), _angelToRadians(43),
        false, pathPaint);
  }

  double _angelToRadians(int angel) => angel * pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

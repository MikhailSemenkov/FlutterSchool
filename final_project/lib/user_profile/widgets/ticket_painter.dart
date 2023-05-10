import 'package:flutter/cupertino.dart';

class TicketPainter extends CustomPainter {
  TicketPainter({required Color ticketColor, required Color backgroundColor})
      : _ticketColor = ticketColor,
        _backgroundColor = backgroundColor;

  final Color _ticketColor;
  final Color _backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(20, 10)
      ..lineTo(size.width - 20, 10)
      ..arcToPoint(
        Offset(size.width - 10, 20),
        radius: const Radius.circular(0.25),
        clockwise: false,
      )
      ..lineTo(size.width - 10, size.height - 20)
      ..arcToPoint(
        Offset(size.width - 20, size.height - 10),
        radius: const Radius.circular(0.25),
        clockwise: false,
      )
      ..lineTo(20, size.height - 10)
      ..arcToPoint(
        Offset(10, size.height - 20),
        radius: const Radius.circular(0.25),
        clockwise: false,
      )
      ..lineTo(10, 20)
      ..arcToPoint(
        const Offset(20, 10),
        radius: const Radius.circular(0.25),
        clockwise: false,
      );
    Paint paint = Paint()..color = _ticketColor;
    canvas.drawPath(path, paint);

    int amount = ((size.height - 20) / 12).floor();
    double space = (size.height - 20 - amount * 10) / (amount - 1);
    Paint linePaint = Paint()..color = _backgroundColor;
    double dx = size.width * 0.75;
    for (int i = 0; i < amount; i++) {
      Rect rect = Rect.fromLTWH(dx, 10 + i * (10 + space), 4, 10);
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(10)),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

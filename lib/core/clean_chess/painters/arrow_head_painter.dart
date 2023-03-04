import 'package:flutter/material.dart';

class ArrowHeadPainter extends CustomPainter {
  ArrowHeadPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _drawArrow(canvas, size, true, Colors.grey.shade900.withAlpha(200));
    _drawArrow(canvas, size, false, Colors.white);
  }

  void _drawArrow(Canvas canvas, Size size, bool fill, Color color) {
    Paint paint = Paint()
      ..style = fill ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;

    final borderPath = Path();
    borderPath.moveTo(0, 0);
    borderPath.lineTo(size.width, size.height * 0.45);
    borderPath.lineTo(size.width, size.height * 0.55);
    borderPath.lineTo(0, size.height);
    borderPath.lineTo(0, size.height * 0.9);
    borderPath.lineTo(0, size.height * 0.8);
    borderPath.lineTo(size.width * 0.7, size.height * 0.5);
    borderPath.lineTo(0, size.height * 0.2);
    borderPath.lineTo(0, size.height * 0.1);
    borderPath.close();

    canvas.drawPath(borderPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

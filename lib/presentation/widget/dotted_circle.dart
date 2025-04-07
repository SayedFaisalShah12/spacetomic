import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dotCount = 6;
    const radius = 120.0;
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dotCount; i++) {
      final angle = (i / dotCount) * 2 * 3.1415926;
      final offset = Offset(
        size.width / 2 + radius * cos(angle),
        size.height / 2 + radius * sin(angle),
      );
      canvas.drawCircle(offset, 6, dotPaint);
      canvas.drawCircle(offset, 3, Paint()..color = Colors.black); // inner black circle
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

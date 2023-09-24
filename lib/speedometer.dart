import 'package:flutter/material.dart';
import 'dart:math';

class Speedometer extends StatelessWidget {
  final String value;

  Speedometer({required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpeedometerPainter(value: value),
    );
  }
}

class SpeedometerPainter extends CustomPainter {
  final String value;

  SpeedometerPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);

    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;

    final circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), radius, backgroundPaint);
    canvas.drawCircle(Offset(centerX, centerY), radius - 20, circlePaint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final textX = centerX - textPainter.width / 2;
    final textY = centerY - textPainter.height / 2;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
import 'dart:math';

import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class DrawSlotsCircle extends CustomPainter {
  final int numberOfSlots;

  DrawSlotsCircle({required this.numberOfSlots});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..color = secondaryColor;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2.5,
    );
    double degToRad(double deg) => deg * (pi / 180.0);
    Path path;
    final availableSlots = 4 - ((numberOfSlots > 4) ? 4 : numberOfSlots);
    if (availableSlots == 4) {
      path = Path()..addOval(rect);
    } else {
      path = Path()
        ..arcTo(
          rect,
          degToRad(270 - (90.0 * availableSlots)),
          degToRad(90.0 * availableSlots),
          true,
        );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

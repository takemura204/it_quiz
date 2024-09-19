import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final bool isVertical;
  final double dashHeight;
  final double dashWidth;
  final double spacing;

  DottedLinePainter({
    required this.isVertical,
    this.dashHeight = 5,
    this.dashWidth = 1.5,
    this.spacing = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = dashWidth;

    if (isVertical) {
      // 縦の点線
      double startY = 0;
      while (startY < size.height * (3 / 4)) {
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashHeight),
          paint,
        );
        startY += dashHeight + spacing;
      }
    } else {
      // 横の点線
      double startX = 0;
      while (startX < size.width) {
        canvas.drawLine(
          Offset(startX, size.height * (3 / 4)),
          Offset(startX + dashHeight, size.height * (3 / 4)),
          paint,
        );
        startX += dashHeight + spacing;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

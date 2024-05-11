import 'dart:math';

import 'package:flutter/material.dart';

class QuarterCircle extends StatelessWidget {
  const QuarterCircle({
    Key? key,
    required this.size,
    required this.colorList,
  }) : super(key: key);

  final double size;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: QuarterCirclePainter(colorList),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  QuarterCirclePainter(this.colorList);

  final List<Color> colorList;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final int segmentCount = colorList.length;
    final double sweepAngle = (2 * pi) / segmentCount;
    double startAngle = -pi / 2;

    for (int i = 0; i < segmentCount; i++) {
      final Path path = Path();
      paint.color = colorList[i];
      path.moveTo(size.width / 2, size.height / 2);
      path.arcTo(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.width / 2),
          startAngle,
          sweepAngle,
          false);
      path.close();
      canvas.drawPath(path, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // You can compare old and new colorList if needed
  }
}

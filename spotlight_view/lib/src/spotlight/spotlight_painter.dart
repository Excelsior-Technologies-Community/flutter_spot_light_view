import 'package:flutter/material.dart';
import 'spotlight_shape.dart';

class SpotlightPainter extends CustomPainter {
  final Rect targetRect;
  final SpotlightShape shape;
  final double radius;
  final Color overlayColor;

  SpotlightPainter({
    required this.targetRect,
    required this.shape,
    required this.radius,
    required this.overlayColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = overlayColor;

    final background = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path hole;

    switch (shape) {
      case SpotlightShape.circle:
        hole = Path()
          ..addOval(
            Rect.fromCircle(
              center: targetRect.center,
              radius: radius,
            ),
          );
        break;

      case SpotlightShape.rectangle:
        hole = Path()..addRect(targetRect);
        break;

      case SpotlightShape.roundedRectangle:
        hole = Path()
          ..addRRect(
            RRect.fromRectAndRadius(
              targetRect,
              Radius.circular(radius),
            ),
          );
        break;
    }

    final combined =
    Path.combine(PathOperation.difference, background, hole);

    canvas.drawPath(combined, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

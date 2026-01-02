import 'package:flutter/material.dart';
import 'spotlight_painter.dart';
import 'spotlight_shape.dart';

class SpotlightOverlay extends StatefulWidget {
  final Rect targetRect;
  final SpotlightShape shape;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;

  const SpotlightOverlay({
    super.key,
    required this.targetRect,
    required this.shape,
    required this.title,
    required this.description,
    required this.onTap,
    this.color = Colors.black,
    this.titleTextStyle,
    this.descriptionTextStyle,
  });

  @override
  State<SpotlightOverlay> createState() => _SpotlightOverlayState();
}

class _SpotlightOverlayState extends State<SpotlightOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _scale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double holeRadius =
    widget.shape == SpotlightShape.circle
        ? (widget.targetRect.longestSide / 2) + 8
        : 14;

    return FadeTransition(
      opacity: _fade,
      child: ScaleTransition(
        scale: _scale,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                CustomPaint(
                  size: MediaQuery.of(context).size,
                  painter: SpotlightPainter(
                    targetRect: widget.targetRect,
                    shape: widget.shape,
                    radius: holeRadius,
                    overlayColor: widget.color.withOpacity(0.75),
                  ),
                ),

                // 📝 Title + Description
                Positioned(
                  top: widget.targetRect.bottom + 16,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: widget.titleTextStyle ??
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: widget.descriptionTextStyle ??
                            const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

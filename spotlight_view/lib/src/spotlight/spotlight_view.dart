import 'package:flutter/material.dart';
import 'package:spotlight_view/src/spotlight/spotlight_step.dart';
import 'spotlight_controller.dart';
import 'spotlight_overlay.dart';
import 'spotlight_shape.dart';

class SpotlightView extends StatefulWidget {
  final Widget child;
  final SpotlightController controller;
  final SpotlightShape shape;
  final String title;
  final String description;
  final Color? color;
  final TextStyle? descriptionTextStyle;
  final TextStyle? titleTextStyle;

  const SpotlightView({
    super.key,
    required this.child,
    required this.controller,
    required this.title,
    required this.description,
    this.shape = SpotlightShape.circle,
    this.color,
    this.descriptionTextStyle,
    this.titleTextStyle,
  });

  @override
  State<SpotlightView> createState() => _SpotlightViewState();
}

class _SpotlightViewState extends State<SpotlightView> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller.registerStep(SpotlightStep(show: _showSpotlight));
  }

  void _showSpotlight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = _key.currentContext?.findRenderObject() as RenderBox?;

      if (box == null || !box.hasSize) return;

      final position = box.localToGlobal(Offset.zero);
      final rect = position & box.size;

      final entry = OverlayEntry(
        builder: (_) => SpotlightOverlay(
          color: widget.color ?? Colors.black,
          targetRect: rect,
          descriptionTextStyle: widget.descriptionTextStyle,
          titleTextStyle: widget.titleTextStyle,
          shape: widget.shape,
          title: widget.title,
          description: widget.description,
          onTap: widget.controller.hide,
        ),
      );

      widget.controller.setEntry(context, entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(key: _key, child: widget.child);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spot_light_view/spotlight/spotlight_step.dart';

class SpotlightController {
  OverlayEntry? _entry;
  VoidCallback? showCallback;

  final List<SpotlightStep> _steps = [];
  int _currentIndex = 0;

  void bind(VoidCallback callback) {
    showCallback = callback;
  }

  void registerStep(SpotlightStep step) {
    _steps.add(step);
  }

  void start() {
    _currentIndex = 0;
    _steps.first.show();
  }

  void next() {
    if (_currentIndex < _steps.length - 1) {
      hide();
      _currentIndex++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _steps[_currentIndex].show();
      });
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      hide();
      _currentIndex--;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _steps[_currentIndex].show();
      });
    }
  }

  void hide() {
    _entry?.remove();
    _entry = null;
  }

  void setEntry(BuildContext context, OverlayEntry entry) {
    hide();
    Overlay.of(context, rootOverlay: true).insert(entry);
    _entry = entry;
  }
}

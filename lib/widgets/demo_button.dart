import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  final GlobalKey buttonKey;

  const DemoButton({super.key, required this.buttonKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: buttonKey,
      onPressed: () {},
      child: const Text('Target Button'),
    );
  }
}

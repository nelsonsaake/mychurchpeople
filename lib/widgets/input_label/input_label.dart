import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}

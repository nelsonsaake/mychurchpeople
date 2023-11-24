import 'package:flutter/material.dart';

class BusyIndicator extends StatelessWidget {
  const BusyIndicator({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 25,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}

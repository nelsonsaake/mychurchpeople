import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space(double space, {super.key})
      : h = space,
        w = space;

  const Space.vertical(double space, {super.key})
      : h = space,
        w = 0;

  const Space.horizontal(double space, {super.key})
      : h = 0,
        w = space;

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}

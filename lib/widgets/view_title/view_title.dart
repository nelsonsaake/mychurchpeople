import 'package:flutter/material.dart';
import 'package:hostels/widgets/space/space.dart';

class ViewTitle extends StatelessWidget {
  const ViewTitle(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //...

        if (Navigator.of(context).canPop())
          const BackButton(
            color: Colors.white,
          ),

        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),

        if (Navigator.of(context).canPop()) const Space.horizontal(15),
      ],
    );
  }
}

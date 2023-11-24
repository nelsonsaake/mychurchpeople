import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Something went wrong",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';

class Button extends StatelessWidget {
  const Button(
    this.label, {
    this.onTap,
    this.isBusy = true,
    this.fillWidth = false,
    this.backgroundColor,
    this.color = Colors.white,
    this.borderRadius,
    super.key,
  });

  final String label;
  final bool isBusy;
  final bool fillWidth;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      //...

      style: TextButton.styleFrom(
        //...

        backgroundColor: backgroundColor ?? ColorResources.dark,

        minimumSize: Size(fillWidth ? double.maxFinite : 300, 50),
        maximumSize: Size(fillWidth ? double.maxFinite : 300, 50),

        elevation: 2,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 30,
          ),
        ),
      ),

      onPressed: isBusy ? null : onTap,

      child: Center(
        child: isBusy
            ? SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: color,
                  strokeWidth: 2,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
    this.label, {
    this.onTap,
    this.isBusy = true,
    this.isOutline = false,
    this.backgroundColor,
    this.color,
    super.key,
  });

  final String label;
  final bool isBusy;
  final bool isOutline;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textColor =
        color ?? (isOutline ? ColorResources.green : Colors.white);

    return TextButton(
      //...

      onPressed: isBusy ? null : onTap,

      style: TextButton.styleFrom(
        //...

        elevation: 2,

        backgroundColor: backgroundColor ??
            (isOutline ? Colors.transparent : ColorResources.green),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            width: 1,
            color: isOutline ? ColorResources.green : Colors.transparent,
          ),
        ),
      ),

      child: Center(
        child: isBusy
            ? SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  color: textColor,
                ),
              ),
      ),
    );
  }
}

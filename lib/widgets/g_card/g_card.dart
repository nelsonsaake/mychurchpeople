import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/busy_indicator/busy_indicator.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class GCard extends StatelessWidget {
  GCard({
    Key? key,
    this.height = 180,
    this.child,
    this.emphasize,
    this.isBusy,
  }) : super(key: key);

  final double height;
  final Widget? child;
  final bool? emphasize;
  final bool? isBusy;

  Color get bottom {
    return emphasize != true ? Colors.grey.shade400 : ColorResources.green;
  }

  final borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      color: Colors.white,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          //...

          Container(
            height: height,
          ),

          Positioned.fill(
            child: Container(
              color: bottom,
              height: height,
            ),
          ),

          ClipPath(
            clipper: ProsteBezierCurve(
              position: ClipPosition.bottom,
              list: [
                BezierCurveSection(
                  start: Offset(0, height * 0.9),
                  top: Offset(width / 2.2, height * 0.94),
                  end: Offset(width, height * 0.70),
                ),
              ],
            ),
            child: Container(
              color: Colors.white,
              height: height,
              width: width,
              child: child,
            ),
          ),

          if (isBusy == true)
            const Positioned(
              top: 10,
              right: 10,
              child: BusyIndicator(
                color: ColorResources.dark,
              ),
            ),
        ],
      ),
    );
  }
}

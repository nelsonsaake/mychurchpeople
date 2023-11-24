import 'package:flutter/material.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/resources/color_resources.dart';

class RoomTypeWidget extends StatelessWidget {
  const RoomTypeWidget(
    this.roomType, {
    super.key,
    this.height,
    this.width,
  });

  final RoomType roomType;
  final double? width;
  final double? height;

  String get image => roomType.image ?? "";

  String get label => [roomType.name ?? ""].join("\n");

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: roomType.tag,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          //...

          color: ColorResources.dark,

          elevation: 2,

          clipBehavior: Clip.hardEdge,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                color: ColorResources.dark,
                width: double.maxFinite,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/widgets/room_type/room_type_widget.dart';

Future showRoomTypeWidgetModal(BuildContext context, RoomType roomType) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: RoomTypeWidget(
            roomType,
            height: 300,
          ),
        ),
      );
    },
  );
}

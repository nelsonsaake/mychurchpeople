import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/views/room_types/room_types_viewmodel.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:stacked/stacked.dart';

class RoomTypeWidget extends StatelessWidget {
  const RoomTypeWidget(this.roomType, {super.key});

  final RoomType roomType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // details
        GCard(
          //...
          height: 150,
          child: GestureDetector(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16.0).copyWith(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    roomType.name ?? "Name N/A",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Capacity ${roomType.capacity ?? "N/A"} ",
                    style: const TextStyle(),
                  ),
                  Text(
                    "Price ${roomType.price ?? "N/A"} ",
                    style: const TextStyle(),
                  ),
                  if (roomType.description?.isNotEmpty == true)
                    Text(
                      "${roomType.description ?? "N/A"} ",
                      style: const TextStyle(),
                    ),
                ],
              ),
            ),
          ),
        ),

        // popup menu
        Positioned(
          right: 0,
          top: 7,
          child: RoomPopupMenu(
            roomType: roomType,
          ),
        ),
      ],
    );
  }
}

class RoomPopupMenu extends ViewModelWidget<RoomTypesViewModel> {
  const RoomPopupMenu({
    super.key,
    required this.roomType,
  });

  final RoomType roomType;

  @override
  Widget build(BuildContext context, RoomTypesViewModel viewModel) {
    return PopupMenuButton(
      surfaceTintColor: Colors.transparent,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            onTap: () async {
              viewModel.nav
                  .navigateToEditRoomTypeView(roomType: roomType)
                  .then((_) => viewModel.refresh());
            },
            child: GestureDetector(
              child: const Text(
                "Edit",
                style: TextStyle(),
              ),
            ),
          ),
          PopupMenuItem(
            child: Builder(builder: (context) {
              return GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  viewModel.delete(context, roomType);
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }),
          ),
        ];
      },
    );
  }
}

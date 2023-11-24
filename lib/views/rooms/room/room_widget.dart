import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/views/rooms/room/room_widget_viewmodel.dart';
import 'package:hostels/views/rooms/rooms_viewmodel.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:stacked/stacked.dart';

class RoomWidget extends StackedView<RoomWidgetViewModel> {
  const RoomWidget(this.room, {super.key});

  final Room room;

  @override
  Widget builder(BuildContext context, RoomWidgetViewModel viewModel, child) {
    return Stack(
      children: [
        // details
        GCard(
          //...
          height: 130,
          child: GestureDetector(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16.0).copyWith(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    viewModel.roomNumber,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${viewModel.floorName}, ${viewModel.roomTypeName}",
                  ),
                  Text(
                    viewModel.capacity,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // price
        Positioned(
          right: 5,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                viewModel.price,
              ),
            ),
          ),
        ),

        // popup menu
        Positioned(
          right: 0,
          top: 7,
          child: RoomPopupMenu(
            room: room,
          ),
        ),
      ],
    );
  }

  @override
  RoomWidgetViewModel viewModelBuilder(BuildContext context) {
    return RoomWidgetViewModel(room);
  }

  @override
  void onViewModelReady(RoomWidgetViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

class RoomPopupMenu extends ViewModelWidget<RoomsViewModel> {
  const RoomPopupMenu({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context, RoomsViewModel viewModel) {
    return PopupMenuButton(
      surfaceTintColor: Colors.transparent,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            onTap: () async {
              viewModel.nav
                  .navigateToEditRoomView(room: room)
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
            child: GestureDetector(
              onTap: () async {
                Navigator.of(context).pop();
                viewModel.delete(context, room);
              },
              child: const Text(
                "Delete",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}

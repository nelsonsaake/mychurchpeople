import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/views/floors/floors_viewmodel.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:stacked/stacked.dart';

class FloorWidget extends StatelessWidget {
  const FloorWidget(this.floor, {super.key});

  final Floor floor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // details
        GCard(
          //...
          height: 100,
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
                    floor.name ?? "Name N/A",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
            floor: floor,
          ),
        ),
      ],
    );
  }
}

class RoomPopupMenu extends ViewModelWidget<FloorsViewModel> {
  const RoomPopupMenu({
    super.key,
    required this.floor,
  });

  final Floor floor;

  @override
  Widget build(BuildContext context, FloorsViewModel viewModel) {
    return PopupMenuButton(
      surfaceTintColor: Colors.transparent,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            onTap: () async {
              viewModel.nav
                  .navigateToEditFloorView(floor: floor)
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
                  viewModel.delete(context, floor);
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

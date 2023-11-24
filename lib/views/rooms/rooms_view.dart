import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/rooms/room/room_widget.dart';
import 'package:hostels/views/rooms/rooms_viewmodel.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

class RoomsView extends StackedView<RoomsViewModel> {
  const RoomsView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.rooms,

      applyPadding: false,

      isBusy: viewModel.isBusy,

      fab: buildFab(viewModel),

      children: [
        //...

        const Space(16),

        ...[
          //...

          buildSectionTitle("Search"),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchInput(
              key: viewModel.searchKey,
              controller: viewModel.search,
              hint: "room number, room type, floor",
            ),
          ),

          const Space(32),
        ],

        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              [
                "Hit the floating plus button to add a new room.",
              ].join("\n"),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),

        const Space(32),

        for (var v in viewModel.roomsByFloors.entries) ...[
          //...

          if (v.value.isNotEmpty) ...[
            //...

            buildSectionTitle(v.key.name ?? ""),

            for (var room in v.value) ...[
              buildRoomWidget(room),
              const Space.vertical(16),
            ],

            const Space(64),
          ]
        ],
      ],
    );
  }

  FloatingActionButton buildFab(RoomsViewModel viewModel) {
    return FloatingActionButton(
      onPressed: viewModel.nav.navigateToCreateRoomView,
      backgroundColor: ColorResources.green,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Padding buildRoomWidget(Room room) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RoomWidget(room),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  RoomsViewModel viewModelBuilder(BuildContext context) {
    return RoomsViewModel();
  }

  @override
  void onViewModelReady(RoomsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

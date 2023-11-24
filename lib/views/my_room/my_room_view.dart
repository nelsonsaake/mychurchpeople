import 'package:flutter/material.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

import 'my_room_viewmodel.dart';
import 'room/room_widget.dart';

class MyRoomView extends StackedView<MyRoomViewModel> {
  const MyRoomView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.myRoom,

      applyPadding: false,

      isBusy: viewModel.isBusy,

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

        for (var room in viewModel.myRooms) ...[
          //...

          buildRoomWidget(room),
          const Space.vertical(16),
        ],
      ],
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
  MyRoomViewModel viewModelBuilder(BuildContext context) {
    return MyRoomViewModel();
  }

  @override
  void onViewModelReady(MyRoomViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

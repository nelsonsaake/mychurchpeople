import 'package:flutter/material.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/room_type_widget_modal/show_room_type_widget_modal.dart';
import 'package:hostels/views/store/room/room_widget.dart';
import 'package:hostels/views/store/store_viewmodel.dart';
import 'package:hostels/widgets/room_type/room_type_widget.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

class StoreView extends StackedView<StoreViewModel> {
  const StoreView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.availableRooms,

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

          const Space(64),
        ],

        if (viewModel.search.text.isEmpty) ...[
          //...

          buildSectionTitle("Room Type"),

          buildRoomTypeListing(viewModel),

          const Space(64),
        ],

        for (var v in viewModel.roomsByFloors.entries) ...[
          //...

          if (v.value.isNotEmpty) ...[
            //...

            buildSectionTitle(v.key.name ?? ""),

            for (var room in v.value) buildRoomWidget(room),

            const Space(64),
          ]
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

  Builder buildRoomTypeListing(StoreViewModel viewModel) {
    return Builder(
      builder: (context) {
        const height = 200.0;
        const width = 160.0;

        return Container(
          constraints: const BoxConstraints(
            maxHeight: height,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              for (var roomType in viewModel.roomTypes)
                GestureDetector(
                  onTap: () {
                    showRoomTypeWidgetModal(
                      context,
                      roomType,
                    );
                  },
                  child: RoomTypeWidget(
                    roomType,
                    height: height,
                    width: width,
                  ),
                ),
            ],
          ),
        );
      },
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
  StoreViewModel viewModelBuilder(BuildContext context) {
    return StoreViewModel();
  }

  @override
  void onViewModelReady(StoreViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

import 'room_type/room_type_widget.dart';
import 'room_types_viewmodel.dart';

class RoomTypesView extends StackedView<RoomTypesViewModel> {
  const RoomTypesView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      key: viewModel.viewKey,

      title: StringResources.roomTypes,

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
              hint: "roomType",
            ),
          ),

          const Space(32),
        ],

        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              [
                "Hit the floating plus button to add a new roomType.",
              ].join("\n"),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),

        const Space(32),

        for (var v in viewModel.filteredRoomTypes) ...[
          //...

          buildFloorWidget(v),

          const Space.vertical(16),
        ],
      ],
    );
  }

  FloatingActionButton buildFab(RoomTypesViewModel viewModel) {
    return FloatingActionButton(
      onPressed: viewModel.nav.navigateToCreateRoomTypeView,
      backgroundColor: ColorResources.green,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Padding buildFloorWidget(RoomType roomType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RoomTypeWidget(roomType),
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
  RoomTypesViewModel viewModelBuilder(BuildContext context) {
    return RoomTypesViewModel();
  }

  @override
  void onViewModelReady(RoomTypesViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

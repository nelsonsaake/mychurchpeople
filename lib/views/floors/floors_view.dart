import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

import 'floor/floor_widget.dart';
import 'floors_viewmodel.dart';

class FloorsView extends StackedView<FloorsViewModel> {
  const FloorsView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.floors,

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
              hint: "floor",
            ),
          ),

          const Space(32),
        ],

        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              [
                "Hit the floating plus button to add a new floor.",
              ].join("\n"),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),

        const Space(32),

        for (var v in viewModel.filteredFloors) ...[
          //...

          buildFloorWidget(v),

          const Space.vertical(16),
        ],
      ],
    );
  }

  FloatingActionButton buildFab(FloorsViewModel viewModel) {
    return FloatingActionButton(
      onPressed: viewModel.nav.navigateToCreateFloorView,
      backgroundColor: ColorResources.green,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Padding buildFloorWidget(Floor floor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FloorWidget(floor),
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
  FloorsViewModel viewModelBuilder(BuildContext context) {
    return FloorsViewModel();
  }

  @override
  void onViewModelReady(FloorsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:stacked/stacked.dart';

import 'room_widget_viewmodel.dart';

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

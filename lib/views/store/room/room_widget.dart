import 'package:flutter/material.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/views/store/room/room_widget_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RoomWidget extends StackedView<RoomWidgetViewModel> {
  const RoomWidget(this.room, {super.key});

  final Room room;

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return Card(
      //...

      elevation: 2,

      clipBehavior: Clip.antiAlias,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: GestureDetector(
        onTap: () => viewModel.onTap(context),
        child: Container(
          height: 150,
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0).copyWith(left: 20),
          decoration: BoxDecoration(
            gradient: ColorResources.lightBackgroundGradient,
          ),
          child: Stack(
            children: [
              //...
              Positioned.fill(
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

              Positioned(
                right: 5,
                bottom: 0,
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
            ],
          ),
        ),
      ),
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

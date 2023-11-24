import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/edit_room/edit_room_viewmodel.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/drop_down/drop_down.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

class EditRoomView extends StackedView<EditRoomViewModel> {
  const EditRoomView(
    this.room, {
    super.key,
  });

  final Room room;

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.rooms,

      applyPadding: true,

      isBusy: viewModel.isBusy,

      child: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //...

            const Space(16),

            const ViewTitle("Update Room Details"),

            const Space(50),

            const InputLabel("Room Number:"),

            const Space(8),

            TextInput(
              controller: viewModel.number,
              validator: ValidationBuilder().required().build(),
            ),

            const Space(50),

            const InputLabel("Room Type:"),

            const Space(8),

            DropDown(
              value: viewModel.selectedRoomType,
              onChanged: viewModel.onRoomTypeSelected,
              items: viewModel.roomTypeDropDownItems,
            ),

            const Space(50),

            const InputLabel("Floor:"),

            const Space(8),

            DropDown(
              value: viewModel.selectedFloor,
              onChanged: viewModel.onFloorSelected,
              items: viewModel.floorDropDownItems,
            ),

            const Space(50),

            Center(
              child: Button(
                "Submit",
                onTap: viewModel.submit,
                isBusy: viewModel.isBusy,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  EditRoomViewModel viewModelBuilder(BuildContext context) {
    return EditRoomViewModel(room);
  }

  @override
  void onViewModelReady(EditRoomViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

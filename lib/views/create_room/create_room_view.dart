import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/create_room/create_room_viewmodel.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/drop_down/drop_down.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

class CreateRoomView extends StackedView<CreateRoomViewModel> {
  const CreateRoomView({super.key});

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

            const ViewTitle("Create Room"),

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
  CreateRoomViewModel viewModelBuilder(BuildContext context) {
    return CreateRoomViewModel();
  }

  @override
  void onViewModelReady(CreateRoomViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

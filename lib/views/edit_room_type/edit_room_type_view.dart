import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/room_type_image_editor/room_type_image_editor.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_area/text_area.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

import 'edit_room_type_viewmodel.dart';

class EditRoomTypeView extends StackedView<EditRoomTypeViewModel> {
  const EditRoomTypeView(this.roomType, {super.key});

  final RoomType roomType;

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...
      key: viewModel.viewKey,

      title: StringResources.roomTypes,

      applyPadding: true,

      child: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //...

            const Space(16),

            const ViewTitle("Edit Room Type"),

            const Space(50),

            const InputLabel("Image:"),

            const Space(8),

            RoomTypeImageEditor(viewModel.roomType),

            const Space(50),

            const InputLabel("Name:"),

            const Space(8),

            TextInput(
              controller: viewModel.name,
              validator: ValidationBuilder().required().build(),
            ),

            const Space(50),

            const InputLabel("Capacity:"),

            const Space(8),

            TextInput(
              type: InputType.int,
              controller: viewModel.capacity,
              validator: ValidationBuilder().required().build(),
            ),

            const Space(50),

            const InputLabel("Price:"),

            const Space(8),

            TextInput(
              type: InputType.money,
              controller: viewModel.price,
              validator: ValidationBuilder().required().build(),
            ),

            const Space(50),

            const InputLabel("Description:"),

            const Space(8),

            TextAreaInput(
              controller: viewModel.description,
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
  EditRoomTypeViewModel viewModelBuilder(BuildContext context) {
    return EditRoomTypeViewModel(roomType);
  }

  @override
  void onViewModelReady(EditRoomTypeViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

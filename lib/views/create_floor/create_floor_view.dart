import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

import 'create_floor_viewmodel.dart';

class CreateFloorView extends StackedView<CreateFloorViewModel> {
  const CreateFloorView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.rooms,

      applyPadding: true,

      child: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //...

            const Space(16),

            const ViewTitle("Create Room"),

            const Space(50),

            const InputLabel("Name:"),

            const Space(8),

            TextInput(
              controller: viewModel.name,
              validator: ValidationBuilder().required().build(),
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
  CreateFloorViewModel viewModelBuilder(BuildContext context) {
    return CreateFloorViewModel();
  }

  @override
  void onViewModelReady(CreateFloorViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

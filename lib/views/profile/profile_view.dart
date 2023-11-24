import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/profile/profile_viewmodel.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/user_photo_editor/user_photo_editor.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    child,
  ) {
    //...

    return ViewLayout(
      //...

      title: "User Profile",

      applyPadding: true,

      child: Builder(
        builder: (context) {
          return Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //...

                const Space.vertical(50),

                // title

                const Center(
                  child: ViewTitle("Update Your Profile"),
                ),

                const Space.vertical(50),

                const UserProfileEditor(),

                const Space.vertical(16),

                // name

                const InputLabel("Name:"),

                const Space.vertical(8),

                TextInput(
                  controller: viewModel.name,
                  validator: ValidationBuilder().required().build(),
                ),

                const Space.vertical(30),

                if (viewModel.enableEmailUpdate) ...[
                  // email

                  const InputLabel("Email:"),

                  TextInput(
                    controller: viewModel.email,
                    validator: ValidationBuilder().email().build(),
                  ),

                  const Space.vertical(30),
                ],

                if (viewModel.enablePasswordFalse) ...[
                  // password

                  const InputLabel("Password:"),

                  TextInput(
                    controller: viewModel.password,
                    obscureText: true,
                    validator:
                        ValidationBuilder().minLength(8).required().build(),
                  ),

                  const Space.vertical(50),
                ],

                // submit

                Center(
                  child: Button(
                    "Save",
                    isBusy: viewModel.isBusy,
                    onTap: viewModel.save,
                  ),
                ),

                const Space.vertical(32),

                // ...
                const Space.vertical(120),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) {
    return ProfileViewModel();
  }

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

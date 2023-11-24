import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/forgot_password/forgot_password_viewmodel.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    child,
  ) {
    //...

    return ViewLayout(
      //...

      applyPadding: true,

      child: Builder(
        builder: (context) {
          //...

          return Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //...

                const Space.vertical(50),

                // title

                const Center(
                  child: ViewTitle("Forgot Password"),
                ),

                const Space.vertical(50),

                // email

                const InputLabel("Email:"),

                TextInput(
                  controller: viewModel.email,
                  validator: ValidationBuilder().email().build(),
                ),

                const Space.vertical(50),

                // submit

                Center(
                  child: Button(
                    "submit",
                    isBusy: viewModel.isBusy,
                    onTap: viewModel.submit,
                  ),
                ),

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
  ForgotPasswordViewModel viewModelBuilder(BuildContext context) {
    return ForgotPasswordViewModel();
  }

  @override
  void onViewModelReady(ForgotPasswordViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

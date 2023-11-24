import 'package:flutter/material.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_viewmodel.dart';

class VerifyEmailView extends StackedView<VerifyEmailViewModel> {
  const VerifyEmailView({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget builder(
    BuildContext context,
    VerifyEmailViewModel viewModel,
    child,
  ) {
    //...

    final email = viewModel.user?.email ?? this.email ?? "you";

    return ViewLayout(
      //...

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
                  child: ViewTitle("Verify Email"),
                ),

                const Space.vertical(50),

                // text

                Center(
                  child: Text(
                    "A verification email has been sent to $email. \nFollow the instructons in it to verify your password",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(30),

                // submit

                Center(
                  child: Button(
                    "Continue",
                    isBusy: viewModel.isBusy,
                    onTap: viewModel.onContinue,
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
  VerifyEmailViewModel viewModelBuilder(BuildContext context) {
    return VerifyEmailViewModel();
  }

  @override
  void onViewModelReady(VerifyEmailViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

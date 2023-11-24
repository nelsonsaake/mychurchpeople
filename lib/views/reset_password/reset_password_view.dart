import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

import 'reset_password_viewmodel.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  const ResetPasswordView({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget builder(
    BuildContext context,
    ResetPasswordViewModel viewModel,
    child,
  ) {
    //...

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
                  child: ViewTitle("Reset Password"),
                ),

                const Space.vertical(50),

                // text

                Center(
                  child: Text(
                    "An email has been sent to ${email ?? "you"}. \nFollow the instructons in it to reset your password",
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
                    "Login",
                    isBusy: viewModel.isBusy,
                    onTap: viewModel.nav.navigateToLoginView,
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
  ResetPasswordViewModel viewModelBuilder(BuildContext context) {
    return ResetPasswordViewModel();
  }

  @override
  void onViewModelReady(ResetPasswordViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

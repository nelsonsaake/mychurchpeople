import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/login/login_viewmodel.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
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
                  child: ViewTitle("Login"),
                ),

                const Space.vertical(50),

                // email

                const InputLabel("Email:"),

                TextInput(
                  controller: viewModel.email,
                  validator: ValidationBuilder().email().build(),
                ),

                const Space.vertical(30),

                // password

                const InputLabel("Password:"),

                TextInput(
                  controller: viewModel.password,
                  obscureText: true,
                  validator:
                      ValidationBuilder().minLength(8).required().build(),
                ),

                const Space.vertical(50),

                // forgot password

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => viewModel.nav.navigateToForgotPasswordView(),
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),

                const Space.vertical(16),

                // submit

                Center(
                  child: Button(
                    "Submit",
                    isBusy: viewModel.isBusy,
                    onTap: viewModel.submit,
                  ),
                ),

                const Space.vertical(32),

                const Center(
                  child: Text(
                    'I want to create an account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(8),

                Center(
                  child: GestureDetector(
                    onTap: () => viewModel.nav.navigateToRegisterView(),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
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
  LoginViewModel viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

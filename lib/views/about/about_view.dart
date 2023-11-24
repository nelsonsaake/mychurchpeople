import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/login/login_viewmodel.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StackedView<LoginViewModel> {
  const AboutView({super.key});

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
                  child: ViewTitle("About"),
                ),

                const Space.vertical(50),

                //

                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        StringResources.atuLogo,
                      ),
                    ),
                  ),
                ),

                const Space.vertical(32),

                const Center(
                  child: Text(
                    "Group 8",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(8),

                const Center(
                  child: Text(
                    "School Project",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(8),

                const Center(
                  child: Text(
                    "Accra Technical University",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(8),

                const Center(
                  child: Text(
                    "Mobile Application Development",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(64),

                const DottedLine(
                  dashColor: Colors.white,
                ),

                const Space.vertical(64),

                const Center(
                  child: Text(
                    "flutter project",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                const Space.vertical(8),

                const Center(
                  child: Text(
                    "powered by firebase",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
  LoginViewModel viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

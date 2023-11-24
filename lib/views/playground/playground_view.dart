import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/playground/playground_viewmodel.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

class PlaygroundView extends StackedView<PlaygroundViewModel> {
  const PlaygroundView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PlaygroundViewModel viewModel,
    Widget? child,
  ) {
    return ViewLayout(
      //...

      noScroll: true,

      children: [
        //...

        buildOutput(viewModel),

        buildSeparator(),

        buildInput(viewModel),
      ],
    );
  }

  Padding buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16,
      ),
      child: DottedLine(dashColor: Colors.white),
    );
  }

  Widget buildInput(PlaygroundViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ...

          const Text(
            "Push the button to do the thing",
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          const Space.vertical(16),

          Button(
            "push",
            isBusy: viewModel.isBusy,
            onTap: viewModel.onPressed,
          ),
        ],
      ),
    );
  }

  Expanded buildOutput(PlaygroundViewModel viewModel) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          //...

          const Space.vertical(50),

          const Center(
            child: Text(
              "Welcome to the Playground",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          const Space.vertical(60),

          viewModel.hasError
              ? Text(
                  "error: ${viewModel.modelError}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              : Text(
                  viewModel.data(),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),

          const Space.vertical(120),
        ],
      ),
    );
  }

  @override
  PlaygroundViewModel viewModelBuilder(BuildContext context) {
    return PlaygroundViewModel();
  }

  @override
  void onViewModelReady(PlaygroundViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

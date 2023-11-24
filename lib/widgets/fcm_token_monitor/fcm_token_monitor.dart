import 'package:flutter/material.dart';
import 'package:hostels/widgets/fcm_token_monitor/fcm_token_monitor_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FcmTokenMonitor extends StackedView<FcmTokenMonitorViewModel> {
  //...

  const FcmTokenMonitor({this.child, super.key});

  final Widget? child;

  @override
  Widget builder(
    BuildContext context,
    FcmTokenMonitorViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      child: this.child,
    );
  }

  @override
  FcmTokenMonitorViewModel viewModelBuilder(BuildContext context) {
    return FcmTokenMonitorViewModel();
  }

  @override
  void onViewModelReady(FcmTokenMonitorViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

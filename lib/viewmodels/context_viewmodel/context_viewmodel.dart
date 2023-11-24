import 'package:flutter/widgets.dart';
import 'package:hostels/app/app.locator.dart';
import 'package:hostels/viewmodels/base_viewmodel_mixin/error_handling_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/base_viewmodel_mixin/message_viewmodel_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class ContextViewModel extends BaseViewModel
    with ErrorHandlingViewModelMixin, MessageViewModelMixin {
  //...

  // nav

  NavigationService get nav => locator<NavigationService>();

  // view key

  GlobalKey? _viewkey;

  GlobalKey get viewKey {
    _viewkey ??= GlobalKey();
    return _viewkey!;
  }

  // refresh

  void refresh() {
    notifyListeners();
  }

  //...
}

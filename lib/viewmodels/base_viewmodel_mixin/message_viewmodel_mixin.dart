import 'package:flutter/material.dart';
import 'package:hostels/factory/scaffold_keys.dart';
import 'package:stacked/stacked.dart';

mixin MessageViewModelMixin on BaseViewModel {
  BuildContext? get context => ScaffoldKeys.key.currentContext;

  showMessage(String msg) {
    final context = this.context;
    if (context == null) return;

    final sfm = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(content: Text(msg));

    clearPendingMessages(value) => sfm.clearSnackBars();
    sfm.showSnackBar(snackBar).closed.then(clearPendingMessages);
  }
}

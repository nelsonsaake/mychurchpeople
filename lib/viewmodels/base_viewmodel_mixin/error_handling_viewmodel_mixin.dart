import 'package:flutter/material.dart';
import 'package:hostels/error_interpreter/error_interpreter.dart';
import 'package:stacked/stacked.dart';

mixin ErrorHandlingViewModelMixin on BaseViewModel {
  //...

  String _lastError = "";

  int _lastErrorRepeatCount = 0;

  showMessage(String errmsg);

  _trackError(String errmsg) {
    if (errmsg == _lastError) {
      _lastErrorRepeatCount++;
    } else {
      _lastError = errmsg;
      _lastErrorRepeatCount = 0;
    }
  }

  bool _hasErrorRepeated(String errmsg, [int count = 1]) {
    //...

    if (errmsg != _lastError) return false;
    return _lastErrorRepeatCount >= count;
  }

  showErrorMessage([String? errmsg]) {
    errmsg ??= modelError?.toString();
    if (errmsg == null) return;

    if (_hasErrorRepeated(errmsg, 2)) return;
    _trackError(errmsg);

    showMessage(errmsg);
  }

  breakflow() {
    // break the normal flow
    // let the error be corrected
    throw "";
  }

  @override
  void onFutureError(error, Object? key) {
    final errmsg = ErrorInterpreter.interpret(error);
    setError(errmsg);
    showErrorMessage(errmsg);
    debugPrint(errmsg);
    breakflow();
  }
}

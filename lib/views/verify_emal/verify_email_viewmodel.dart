import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class VerifyEmailViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  onContinue() async {
    await refreshUserData();
    if (isEmailVerified) {
      nav.navigateToStoreView();
    } else {
      showMessage("Please verify your email.");
    }
  }

  init() async {}
}

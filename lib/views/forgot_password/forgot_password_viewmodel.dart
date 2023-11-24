import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class ForgotPasswordViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  Future submit() async {
    if (formKey.currentState!.validate()) {
      sendPasswordResetEmail(email.text);
      nav.navigateToResetPasswordView();
    }
  }

  init() async {}
}

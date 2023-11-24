import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/factory/scaffold_keys.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class RegisterViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  Future submit() async {
    if (formKey.currentState!.validate()) {
      await register(email.text, password.text, name.text);
      await sendEmailVerification();
      nav.navigateToVerifyEmailView();
    }
  }

  init() async {
    ScaffoldKeys.key.currentState?.openDrawer();
  }
}

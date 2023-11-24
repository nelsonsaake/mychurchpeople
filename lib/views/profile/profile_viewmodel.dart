import 'package:flutter/material.dart';
import 'package:hostels/factory/scaffold_keys.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class ProfileViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  late TextEditingController name = TextEditingController(
    text: user?.displayName,
  );

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool get enableEmailUpdate => false;

  bool get enablePasswordFalse => false;

  Future save() async {
    if (formKey.currentState!.validate()) {
      await updateDisplayName(name.text);
      showMessage("update successful");
    }
  }

  init() async {
    ScaffoldKeys.key.currentState?.openDrawer();
  }
}

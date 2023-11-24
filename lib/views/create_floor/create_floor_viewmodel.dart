import 'package:flutter/material.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/save_floor_viewmodel_mixin.dart';

class CreateFloorViewModel extends ContextViewModel
    with SaveFloorViewModelMixin, GetFloorsViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  // clear data

  clear() {
    if (hasError) return;
    name.clear();
    notifyListeners();
  }

  showSuccessMessage() {
    if (hasError) return;
    showMessage("Floor created successfully");
  }

  submit() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }
    await saveFloor(Floor(
      name: name.text,
    ));
    await getFloors();
    clear();
    showSuccessMessage();
  }

  init() async {}
}

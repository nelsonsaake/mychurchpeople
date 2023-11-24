import 'package:flutter/material.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/save_floor_viewmodel_mixin.dart';

class EditFloorViewModel extends ContextViewModel
    with SaveFloorViewModelMixin, GetFloorsViewModelMixin {
  //...

  EditFloorViewModel(Floor floor)
      : id = floor.id,
        name = TextEditingController(text: floor.name);

  //...

  final String? id;

  final formKey = GlobalKey<FormState>();

  TextEditingController name;

  // clear data

  clear() {
    if (hasError) return;
    name.clear();
    notifyListeners();
  }

  showSuccessMessage() {
    if (hasError) return;
    showMessage("Update successfully");
  }

  submit() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }
    await saveFloor(Floor(
      id: id,
      name: name.text,
    ));
    await getFloors();
    showSuccessMessage();
  }

  init() async {}
}

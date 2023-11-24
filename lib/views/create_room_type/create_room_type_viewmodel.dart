import 'package:flutter/material.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/save_room_type_viewmodel_mixin.dart';

class CreateRoomTypeViewModel extends ContextViewModel
    with SaveRoomTypeViewModelMixin, GetRoomTypesViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController capacity = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController description = TextEditingController();

  // clear data

  clear() {
    if (hasError) return;
    name.clear();
    capacity.clear();
    price.clear();
    description.clear();
    notifyListeners();
  }

  showSuccessMessage() {
    if (hasError) return;
    showMessage("Create successful");
  }

  submit() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }
    await saveRoomType(RoomType(
      name: name.text,
      capacity: int.tryParse(capacity.text),
      price: double.tryParse(price.text),
      description: description.text,
    ));
    await getRoomTypes();
    clear();
    showSuccessMessage();
  }

  init() async {}
}

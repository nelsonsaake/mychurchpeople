import 'package:flutter/material.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/save_room_type_viewmodel_mixin.dart';

class EditRoomTypeViewModel extends ContextViewModel
    with SaveRoomTypeViewModelMixin, GetRoomTypesViewModelMixin {
  //...

  EditRoomTypeViewModel(this.roomType)
      : name = TextEditingController(text: roomType.name),
        capacity = TextEditingController(text: roomType.capacity?.toString()),
        price = TextEditingController(text: roomType.price?.toString()),
        description = TextEditingController(text: roomType.description);

  final RoomType roomType;

  //...

  final formKey = GlobalKey<FormState>();

  final TextEditingController name;

  final TextEditingController capacity;

  final TextEditingController price;

  final TextEditingController description;

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
    showMessage("Update successfully");
  }

  submit() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }
    await saveRoomType(RoomType(
      id: roomType.id,
      image: roomType.image,
      name: name.text,
      capacity: int.tryParse(capacity.text),
      price: double.tryParse(price.text),
      description: description.text,
    ));
    await getRoomTypes();
    showSuccessMessage();
  }

  init() async {}
}

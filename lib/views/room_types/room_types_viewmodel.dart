import 'package:flutter/material.dart';
import 'package:hostels/error_interpreter/error_interpreter.dart';
import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/helpers/contains.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/views/get_delete_confirmation/get_delete_confirmation.dart';

class RoomTypesViewModel extends ContextViewModel
    with GetRoomTypesViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => notifyListeners());

  bool isPass(RoomType roomType) {
    return contains(roomType.toMap().toString(), search.text);
  }

  List<RoomType> get filteredRoomTypes {
    return roomTypes.where((roomType) => isPass(roomType)).toList();
  }

  Future _delete(BuildContext context, RoomType roomType) async {
    final confirmation = await getDeleteConfirmation(
      context,
      resource: roomType.name ?? "RoomType",
    );
    if (confirmation == true) {
      await RoomTypes.delete(roomType.id);
      await getRoomTypes();
    }
  }

  Future delete(BuildContext context, RoomType roomType) async {
    try {
      await _delete(context, roomType);
    } catch (e) {
      showMessage(ErrorInterpreter.interpret(e));
    }
  }

  init() async {
    await getRoomTypes();
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/error_interpreter/error_interpreter.dart';
import 'package:hostels/firestore/collections/rooms.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_payments_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/organise_rooms_viewmodel_mixin.dart';
import 'package:hostels/views/get_delete_confirmation/get_delete_confirmation.dart';

class RoomsViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        GetRoomTypesViewModelMixin,
        GetFloorsViewModelMixin,
        GetRoomsViewModelMixin,
        GetPaymentsViewModelMixin,
        OrganiseRoomsViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => organiseRoomsForStore());

  @override
  String get searchText => search.text;

  Future _delete(BuildContext context, Room room) async {
    final confirmation = await getDeleteConfirmation(
      context,
      resource: "Room",
    );
    if (confirmation == true) {
      await Rooms.delete(room.id);
      await getRooms();
      await organiseRoomsForStore();
    }
  }

  Future delete(BuildContext context, Room room) async {
    try {
      await _delete(context, room);
    } catch (e) {
      showMessage(ErrorInterpreter.interpret(e));
    }
  }

  init() async {
    await getRoomTypes();
    await getFloors();
    await getRooms();
    await organiseRoomsForStore();
    await getPayments();
  }
}

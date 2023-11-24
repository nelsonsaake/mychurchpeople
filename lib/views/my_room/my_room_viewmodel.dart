import 'package:flutter/material.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_payments_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/organise_rooms_viewmodel_mixin.dart';

class MyRoomViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        GetRoomTypesViewModelMixin,
        GetFloorsViewModelMixin,
        GetRoomsViewModelMixin,
        OrganiseRoomsViewModelMixin,
        GetPaymentsViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => notifyListeners());

  @override
  String get searchText => search.text;

  bool didUserPayForRoom(Room room) {
    return payments
        .where((p) => p.roomId == room.id && p.email == user?.email)
        .isNotEmpty;
  }

  List<Room> get myRooms {
    return rooms.where((room) => didUserPayForRoom(room)).toList();
  }

  init() async {
    await getRoomTypes();
    await getFloors();
    await getRooms();
    await organiseRoomsForStore();
    await getPayments();
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_payments_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/organise_rooms_viewmodel_mixin.dart';
import 'package:hostels/views/room_type_widget_modal/show_room_type_widget_modal.dart';

class StoreViewModel extends ContextViewModel
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
    ..addListener(() => organiseRoomsForStore());

  @override
  String get searchText => search.text;

  showBuyModal(
    BuildContext context,
    RoomType roomType,
    Room room,
  ) {
    return showRoomTypeWidgetModal(
      context,
      roomType,
    );
  }

  onTap(
    BuildContext context,
    RoomType roomType,
    Room room,
  ) {}

  init() async {
    await firestoreinit();
    await getRoomTypes();
    await getFloors();
    await getRooms();
    await organiseRoomsForStore();
    await getPayments();
  }
}

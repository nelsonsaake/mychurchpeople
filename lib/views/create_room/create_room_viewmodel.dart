import 'package:flutter/material.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/save_room_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';

class CreateRoomViewModel extends ContextViewModel
    with
        GetRoomTypesViewModelMixin,
        GetFloorsViewModelMixin,
        GetRoomsViewModelMixin,
        SaveRoomViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  TextEditingController number = TextEditingController();

  // handle room type drop down

  String? _selectedRoomType;

  String? get selectedRoomType => _selectedRoomType;

  onRoomTypeSelected(String v) {
    _selectedRoomType = v;
    notifyListeners();
  }

  Map<String, String> get roomTypeDropDownItems {
    return {
      for (RoomType v in roomTypes) v.id ?? "": v.name ?? "",
    };
  }

  // handle floor drop down

  String? _selectedFloor;

  String? get selectedFloor => _selectedFloor;

  onFloorSelected(String v) {
    _selectedFloor = v;
    notifyListeners();
  }

  Map<String, String> get floorDropDownItems {
    return {
      for (Floor v in floors) v.id ?? "": v.name ?? "",
    };
  }

  // clear data

  clear() {
    if (hasError) return;
    number.clear();
    _selectedFloor = null;
    _selectedRoomType = null;
    notifyListeners();
  }

  showSuccessMessage() {
    if (hasError) return;
    showMessage("Room created successfully");
  }

  submit() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }
    await saveRoom(Room(
      floorId: selectedFloor,
      number: number.text,
      roomTypeId: selectedRoomType,
    ));
    await getRooms();

    clear();
    showSuccessMessage();
  }

  init() async {
    if (roomTypes.isEmpty) {
      await getRoomTypes();
    }
    if (floors.isEmpty) {
      await getFloors();
    }
  }
}

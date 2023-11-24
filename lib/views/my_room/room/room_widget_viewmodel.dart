import 'package:hostels/helpers/format_capacity.dart';
import 'package:hostels/helpers/format_price.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_payments_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';

class RoomWidgetViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        GetRoomsViewModelMixin,
        GetFloorsViewModelMixin,
        GetPaymentsViewModelMixin,
        GetRoomTypesViewModelMixin {
  //...

  RoomWidgetViewModel(this.room);

  // room

  final Room room;

  // floor

  Floor? _floor;

  Floor? get floor => _floor;

  // room type

  RoomType? _roomType;

  RoomType? get roomType => _roomType;

  //....

  String get roomNumber => room.number ?? "";

  String get floorName => floor?.name ?? "";

  String get roomTypeName => roomType?.name ?? "";

  String get price => formatPrice(roomType?.price);

  String get capacity => formatCapacity(
        countPaymentForThisRoom(),
        roomType?.capacity,
      );

  int countPaymentForThisRoom() {
    int sum = 0;
    for (Payment p in payments) {
      if (p.roomId == room.id) {
        sum++;
      }
    }
    return sum;
  }

  init() async {
    //...

    if (room.floorId != null) {
      _floor = floors.where((f) => f.id == room.floorId).firstOrNull;
    }

    if (room.roomTypeId != null) {
      _roomType = roomTypes.where((rt) => rt.id == room.roomTypeId).firstOrNull;
    }
  }
}

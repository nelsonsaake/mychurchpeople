import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/helpers/format_capacity.dart';
import 'package:hostels/helpers/format_price.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/paystack/service/paystack_service.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_payments_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_room_types_viewmodel_mixin.dart';

class RoomWidgetViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        GetFloorsViewModelMixin,
        GetRoomTypesViewModelMixin,
        GetPaymentsViewModelMixin {
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

  Future _showBuyModal(BuildContext context) async {
    //...

    final email = user?.email;

    if (email == null) {
      showMessage("please login to continue");
      return;
    }

    final amount = roomType?.price;

    if (amount == null) {
      showMessage("something went wrong, please try another room");
      return;
    }

    final payment = Payment(
      amount: amount,
      email: email,
      roomId: room.id,
    );

    return PaystackService.showModal(context, payment);
  }

  Future showBuyModal(BuildContext context) {
    return runBusyFuture(_showBuyModal(context));
  }

  Future onTap(BuildContext context) {
    //...

    if (!isLoggedIn) return nav.navigateToLoginView();

    return showBuyModal(context);
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

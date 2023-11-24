import 'package:flutter/material.dart';
import 'package:hostels/helpers/contains.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_payments_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';

class PaymentsViewModel extends ContextViewModel
    with GetPaymentsViewModelMixin, GetRoomsViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => notifyListeners());

  bool isPass(Payment payment) {
    return contains(payment.toMap().toString(), search.text);
  }

  List<Payment> get filteredPayments {
    return payments.where((payment) => isPass(payment)).toList();
  }

  String roomNumber(Payment payment) {
    final ls = rooms.where((room) => room.id == payment.roomId);
    if (ls.isEmpty) return "";
    return ls.first.number ?? "";
  }

  double get total {
    double sum = 0;
    for (Payment p in payments) {
      sum += p.amount ?? 0;
    }
    return sum;
  }

  init() async {
    await getPayments();
    if (rooms.isEmpty) {
      getRooms();
    }
  }
}

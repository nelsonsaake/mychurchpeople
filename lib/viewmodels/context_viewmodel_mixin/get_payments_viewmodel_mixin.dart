import 'package:hostels/firestore/collections/payments.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetPaymentsViewModelMixin on ContextViewModel {
  //...

  static List<Payment> _payments = [];

  List<Payment> get payments => _payments;

  Future _getPayments() async {
    _payments = await Payments.get();
  }

  Future getPayments() async {
    return runBusyFuture(_getPayments());
  }
}

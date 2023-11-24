import 'package:flutter/material.dart';
import 'package:hostels/helpers/format_date_time.dart';
import 'package:hostels/helpers/format_price.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/views/payments/payments_viewmodel.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

class PaymentWidget extends ViewModelWidget<PaymentsViewModel> {
  const PaymentWidget(this.payment, {super.key});

  final Payment payment;

  @override
  Widget build(BuildContext context, PaymentsViewModel viewModel) {
    return Stack(
      children: [
        // details
        GCard(
          emphasize: true,
          //...
          height: 370,
          child: GestureDetector(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16.0).copyWith(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //...

                  const Text("amount:"),
                  Text(
                    formatPrice(payment.amount),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Space.vertical(15),

                  const Text("paid at:"),
                  Text(
                    "${formatTime(payment.paidAt)}, ${formatDate2(payment.paidAt)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Space.vertical(15),

                  const Text("payment for:"),
                  Text(
                    viewModel.roomNumber(payment),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Space.vertical(15),

                  const Text("paid by:"),
                  Text(
                    payment.email ?? "Email N/A",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

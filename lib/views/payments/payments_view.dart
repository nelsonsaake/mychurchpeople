import 'package:flutter/material.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/payments/total_amount_paid/total_amount_paid.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

import 'payments/payment_widget.dart';
import 'payments_viewmodel.dart';

class PaymentsView extends StackedView<PaymentsViewModel> {
  const PaymentsView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.payments,

      applyPadding: false,

      isBusy: viewModel.isBusy,

      children: [
        //...

        const Space(16),

        ...[
          //...

          buildSectionTitle("Search"),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchInput(
              key: viewModel.searchKey,
              controller: viewModel.search,
              hint: "payment",
            ),
          ),

          const Space(32),
        ],

        buildSectionTitle("Total"),

        const Space(16),

        const TotalAmountPaid(),

        const Space(32),

        buildSectionTitle("Payment break down"),

        for (var v in viewModel.filteredPayments) ...[
          //...

          buildPaymentWidget(v),

          const Space.vertical(16),
        ],
      ],
    );
  }

  Padding buildPaymentWidget(Payment payment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PaymentWidget(payment),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  PaymentsViewModel viewModelBuilder(BuildContext context) {
    return PaymentsViewModel();
  }

  @override
  void onViewModelReady(PaymentsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

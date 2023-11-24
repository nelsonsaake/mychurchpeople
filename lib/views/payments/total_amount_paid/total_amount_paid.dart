import 'package:flutter/material.dart';
import 'package:hostels/helpers/format_price.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/views/payments/payments_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TotalAmountPaid extends ViewModelWidget<PaymentsViewModel> {
  const TotalAmountPaid({
    super.key,
  });

  @override
  Widget build(BuildContext context, PaymentsViewModel viewModel) {
    return SizedBox(
      width: 300,
      height: 250,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 300,
              height: 150,
              decoration: const BoxDecoration(
                color: ColorResources.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                width: 300,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "GhC",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorResources.dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatPriceAmount(viewModel.total),
                      style: const TextStyle(
                        fontSize: 34,
                        color: ColorResources.dark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

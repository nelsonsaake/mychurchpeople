import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hostels/firestore/collections/payments.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/paystack/client/paystack_client.dart';
import 'package:hostels/paystack/modal/show_paystack_modal.dart';
import 'package:hostels/paystack/models/create_payment_request.dart';
import 'package:hostels/paystack/models/create_payment_response.dart';

class PaystackService {
  //...

  // ignore: unused_field
  static const String _pk = "pk_test_cd448417e8366fc543bc92ddd9e0903e01ec95bf";

  // ignore: unused_field
  static const String _sk = "sk_test_664903877166e55bd8a956aef88d3d58fd795d22";

  static CreatePaymentResponse? paystackPayment;

  static Payment? payment;

  static PaystackClient get client {
    //...

    final headers = {"Authorization": "Bearer $_sk"};

    final dio = Dio(BaseOptions(headers: headers));

    return PaystackClient(dio);
  }

  static Future createPayment(Payment vPayment) async {
    //...

    final email = vPayment.email;

    final amount = vPayment.amount;

    if (email == null || amount == null) {
      debugPrint(
          "[PaystackService.createPayment] email($email) or amount($amount) is null");
      throw "something went wrong";
    }

    final req = CreatePaymentRequest(
      email: email,
      amount: (amount * 100).toInt(),
      metadata: Metadata(
        email: vPayment.email,
        roomId: vPayment.roomId,
      ),
    );

    paystackPayment = await client.createPayment(req);
    payment = vPayment;
  }

  static Future<String> paystackurl(Payment payment) async {
    //...

    await createPayment(payment);

    return paystackPayment?.data?.authorizationUrl ?? "";
  }

  static Future verifyPayment() async {
    //...

    final reference = paystackPayment?.data?.reference;

    if (reference == null) return;

    final response = await client.verifyPayment(reference);

    if (response.data?.status != "success") return null;

    if (payment == null) return null;

    Payments.save(Payment(
      email: payment?.email,
      roomId: payment?.roomId,
      amount: payment?.amount,
      paidAt: response.data?.paidAt,
    ));
  }

  static Future showModal(
    BuildContext context,
    Payment payment,
  ) async {
    // ...

    await showPaystackModal(
      context,
      paystackurl(payment),
    );

    await verifyPayment();
  }
}

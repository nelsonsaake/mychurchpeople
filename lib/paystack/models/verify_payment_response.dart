import 'package:hostels/paystack/models/create_payment_request.dart';

class VerifyPaymentResponse {
  bool? status;
  String? message;
  Data? data;

  VerifyPaymentResponse({this.status, this.message, this.data});

  VerifyPaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? domain;
  String? status;
  String? reference;
  int? amount;
  String? paidAt;
  String? currency;
  Metadata? metadata;

  Data({
    this.id,
    this.domain,
    this.status,
    this.reference,
    this.amount,
    this.paidAt,
    this.currency,
    this.metadata,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    status = json['status'];
    reference = json['reference'];
    amount = json['amount'];
    paidAt = json['paid_at'];
    currency = json['currency'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    paidAt = json['paidAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['domain'] = domain;
    data['status'] = status;
    data['reference'] = reference;
    data['amount'] = amount;
    data['paid_at'] = paidAt;
    data['currency'] = currency;
    data['metadata'] = metadata?.toJson();
    data['paidAt'] = paidAt;
    return data;
  }
}

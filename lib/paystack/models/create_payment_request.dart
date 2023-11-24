class CreatePaymentRequest {
  int? amount;
  String? email;
  Metadata? metadata;

  CreatePaymentRequest({this.amount, this.email, this.metadata});

  CreatePaymentRequest.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    email = json['email'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['email'] = email;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Metadata {
  final String? roomId;
  final String? email;

  Metadata({this.roomId, this.email});

  Metadata.fromJson(Map<String, dynamic> json)
      : roomId = json['roomId'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['email'] = email;
    return data;
  }
}

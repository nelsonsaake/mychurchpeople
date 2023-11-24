class CreatePaymentResponse {
  bool? status;
  String? message;
  Data? data;

  CreatePaymentResponse({this.status, this.message, this.data});

  CreatePaymentResponse.fromJson(Map<String, dynamic> json) {
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
  String? authorizationUrl;
  String? accessCode;
  String? reference;

  Data({this.authorizationUrl, this.accessCode, this.reference});

  Data.fromJson(Map<String, dynamic> json) {
    authorizationUrl = json['authorization_url'];
    accessCode = json['access_code'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorization_url'] = authorizationUrl;
    data['access_code'] = accessCode;
    data['reference'] = reference;
    return data;
  }
}

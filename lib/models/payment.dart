class Payment {
  const Payment({
    this.id,
    this.roomId,
    this.email,
    this.amount,
    this.paidAt,
  });
  final String? id;
  final String? roomId;
  final String? email;
  final double? amount;
  final String? paidAt;

  Payment.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        roomId = json['roomId'],
        amount = json['amount'],
        email = json['email'],
        paidAt = json['paidAt'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roomId'] = roomId;
    data['email'] = email;
    data['amount'] = amount;
    data['paidAt'] = paidAt;
    return data;
  }
}

class Device {
  const Device({
    this.id,
    this.token,
    this.userId,
    this.deviceType,
  });

  final int? id;
  final int? userId;
  final String? token;
  final String? deviceType;

  Device.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        token = json['token'],
        userId = json['user_id'],
        deviceType = json['device_type'];

  factory Device.fromJson(Map<String, dynamic> json) => Device.fromMap(json);

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['user_id'] = userId;
    data['device_type'] = deviceType;
    return data;
  }

  toJson() => toMap();
}

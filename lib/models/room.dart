class Room {
  Room({
    this.id,
    this.roomTypeId,
    this.floorId,
    this.number,
  });

  final String? id;
  final String? roomTypeId;
  final String? floorId;
  final String? number;

  Room.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        roomTypeId = json['roomTypeId'],
        floorId = json['floorId'],
        number = json['number'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roomTypeId'] = roomTypeId;
    data['floorId'] = floorId;
    data['number'] = number;
    return data;
  }
}

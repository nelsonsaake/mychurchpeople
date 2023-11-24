class RoomType {
  const RoomType({
    this.id,
    this.name,
    this.capacity,
    this.image,
    this.currency,
    this.price,
    this.description,
  });
  final String? id;
  final int? capacity;
  final String? name;
  final String? image;
  final String? currency;
  final double? price;
  final String? description;

  get tag => "roomType#$id";

  RoomType.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        capacity = json['capacity'],
        image = json['image'],
        currency = json['currency'],
        price = json['price'],
        description = json['description'];

  RoomType copyWith({
    String? id,
    String? name,
    int? capacity,
    String? image,
    String? currency,
    double? price,
    String? description,
  }) {
    return RoomType(
      id: id ?? this.id,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      image: image ?? this.image,
      currency: currency ?? this.currency,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['capacity'] = capacity;
    data['image'] = image;
    data['currency'] = currency;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}

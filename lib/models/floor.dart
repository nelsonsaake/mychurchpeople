class Floor {
  const Floor({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  Floor.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

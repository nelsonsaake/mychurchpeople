import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/room_type.dart';

class RoomTypes {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.roomTypes);
  }

  static Future<RoomType> save(RoomType v) async {
    //...

    final id = v.id ?? (await ref.add({})).id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return RoomType.fromMap(map);
  }

  static Future<List<RoomType>> get({int? page}) async {
    return [
      for (Document doc in await ref.get()) RoomType.fromMap(doc.map),
    ];
  }

  static Future<RoomType> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return RoomType.fromMap(doc.map);
  }

  static Future<RoomType> set(String id, RoomType roomType) async {
    //...

    final map = roomType.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return roomType;
  }

  static Future delete(String? id) async {
    if (id == null) return;
    return ref.document(id).delete();
  }
}

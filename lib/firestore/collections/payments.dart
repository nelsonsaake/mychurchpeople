import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/payment.dart';

class Payments {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.payments);
  }

  static Future<Payment> save(Payment v) async {
    //...

    final id = v.id ?? (await ref.add({})).id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return Payment.fromMap(map);
  }

  static Future<List<Payment>> get({int? page}) async {
    return [
      for (Document doc in await ref.get()) Payment.fromMap(doc.map),
    ];
  }

  static Future<Payment> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return Payment.fromMap(doc.map);
  }

  static Future<Payment> set(String id, Payment payment) async {
    //...

    final map = payment.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return payment;
  }

  static Future delete(String? id) async {
    if (id == null) return;
    return ref.document(id).delete();
  }
}

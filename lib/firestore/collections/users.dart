import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';
import 'package:hostels/models/user.dart';

class Users {
  //...

  static CollectionReference get ref {
    return Firestore.instance.collection(FirebaseCollections.users);
  }

  static Future<AppUser> save(AppUser v) async {
    //...

    // if the record already exists we update it
    final String id = v.id ??
        // if the email already exist
        // we update that record
        (await findByEmail(v.email))?.id ??
        // otherwise we allocate document for this new cord
        (await ref.add({})).id;

    final map = v.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return AppUser.fromMap(map);
  }

  static Future<List<AppUser>> get({int? page}) async {
    //...

    return [for (Document doc in await ref.get()) AppUser.fromMap(doc.map)];
  }

  static Future<AppUser> find(String id) async {
    //...

    final doc = await ref.document(id).get();

    return AppUser.fromMap(doc.map);
  }

  static Future<AppUser?> findByEmail(String? email) async {
    //...

    if (email == null) return null;

    final docs = await ref.where("email", isEqualTo: email).get();

    if (docs.isEmpty) return null;

    return AppUser.fromMap(docs.first.map);
  }

  static Future updateDisplayName(String? email, String name) async {
    //...

    if (email == null) return null;

    final user = await findByEmail(email);

    if (user == null) return;

    final map = user.toMap();

    map["name"] = name;

    final updatedUser = AppUser.fromMap(map);

    return save(updatedUser);
  }

  static Future updatePhotoURL(String? email, String url) async {
    //...

    if (email == null) return null;

    final user = await findByEmail(email);

    if (user == null) return;

    final map = user.toMap();

    map["photoURL"] = url;

    final updatedUser = AppUser.fromMap(map);

    return save(updatedUser);
  }

  static Future<AppUser> set(String id, AppUser user) async {
    //...

    final map = user.toMap();

    map["id"] = id;

    await ref.document(id).set(map);

    return user;
  }

  static Future<bool> isAdmin(String email) async {
    //...

    final users = await ref
        .where("email", isEqualTo: email)
        .where("isAdmin", isEqualTo: true)
        .get();

    return users.isNotEmpty;
  }

  static Future<bool> toggleIsAmin(String email) async {
    //...

    final docs = await ref.where("email", isEqualTo: email).get();

    if (docs.isEmpty) {
      //...

      (await save(AppUser(email: email, isAdmin: true)));

      return true;
    }

    for (Document doc in docs) {
      //...
      // just update the first one

      final user = AppUser.fromMap(doc.map);

      final map = user.toMap();

      final isAdmin = !user.isAdmin;

      map["isAdmin"] = isAdmin;

      final updatedUser = await save(AppUser.fromMap(map));

      return updatedUser.isAdmin;
    }

    return false;
  }

  static Future delete(String email) async {
    //...

    final users = await ref.where("email", isEqualTo: email).get();

    for (var user in users) {
      await user.reference.delete();
    }
  }
}

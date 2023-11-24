import 'package:firedart/firedart.dart';
import 'package:hostels/firestore/collections.dart';

Future clear(collection) async {
  //...
  final ls = await Firestore.instance.collection(collection).get();
  for (Document v in ls) {
    await v.reference.delete();
  }
}

Future fresh() async {
  for (String collection in FirebaseCollections.all) {
    await clear(collection);
  }
}

import 'package:hostels/firestore/collections/users.dart';
import 'package:hostels/firestore/firestore_config.dart';
import 'package:hostels/models/user.dart';

Future seedUsers() async {
  final emails = [
    FirestoreConfig.email,
  ];
  for (var email in emails) {
    await Users.save(AppUser(email: email, isAdmin: true));
  }
}

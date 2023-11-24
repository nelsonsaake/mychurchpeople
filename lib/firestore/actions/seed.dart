import 'package:hostels/firestore/seeders/seed_users.dart';
import 'package:hostels/firestore/seeders/seed_floors.dart';
import 'package:hostels/firestore/seeders/seed_room_types.dart';
import 'package:hostels/firestore/seeders/seed_rooms.dart';

Future seed() async {
  await seedUsers();
  await seedFloors();
  await seedRoomTypes();
  await seedRooms();
}

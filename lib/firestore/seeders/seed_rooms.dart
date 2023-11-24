import 'package:hostels/firestore/collections/floors.dart';
import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/firestore/collections/rooms.dart';
import 'package:hostels/helpers/number_to_letter.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/models/room.dart';

T random<T>(List<T> ls) {
  final newls = [...ls]..shuffle();
  return newls.first;
}

String roomNumber(int floor, int i) {
  return "${numberToLetter(floor + 1)}$i";
}

Future seedRooms() async {
  //...

  final floors = await Floors.get();
  final roomTypes = await RoomTypes.get();
  const numberOfRoomPerFloor = 3;

  for (Floor floor in floors) {
    for (int i = 1; i <= numberOfRoomPerFloor; i++) {
      final room = Room(
        floorId: floor.id,
        roomTypeId: random(roomTypes).id,
        number: roomNumber(floors.indexOf(floor), i),
      );
      await Rooms.save(room);
    }
  }
}

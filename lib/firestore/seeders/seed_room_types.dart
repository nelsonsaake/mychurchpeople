import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/resources/image_resources.dart';

Future seedRoomTypes() async {
  final ls = [
    const RoomType(
      name: "One in a room",
      image: ImageResources.one,
      price: 5000,
      capacity: 1,
    ),
    const RoomType(
      name: "Two in a room",
      image: ImageResources.two,
      price: 4000,
      capacity: 2,
    ),
    const RoomType(
      name: "Four in a room",
      image: ImageResources.three,
      price: 3000,
      capacity: 4,
    ),
    const RoomType(
      name: "Six in a room",
      image: ImageResources.four,
      price: 2000,
      capacity: 6,
    ),
  ];

  for (RoomType v in ls) {
    await RoomTypes.save(v);
  }
}

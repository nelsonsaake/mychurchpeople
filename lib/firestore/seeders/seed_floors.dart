import 'package:hostels/firestore/collections/floors.dart';
import 'package:hostels/models/floor.dart';

Future seedFloors() async {
  final floorNames = [
    "Ground Floor",
    "First Floor",
    "Second Floor",
  ];
  for (var v in floorNames) {
    await Floors.save(Floor(name: v));
  }
}

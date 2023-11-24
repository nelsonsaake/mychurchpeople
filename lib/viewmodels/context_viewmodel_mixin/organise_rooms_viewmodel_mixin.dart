import 'package:hostels/models/floor.dart';
import 'package:hostels/models/payment.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin OrganiseRoomsViewModelMixin on ContextViewModel {
  //...
  // the viewmodel that would this will be mixed with need to implement
  // roos, floors, searchText, roomTypes, and payments

  List<Room> get rooms;

  List<Floor> get floors;

  List<RoomType> get roomTypes;

  List<Payment> get payments;

  String get searchText;

  Map<Floor, List<Room>> _roomsByFloors = {};

  Map<Floor, List<Room>> get roomsByFloors => _roomsByFloors;

  int countPaymentForRoom(Room room) {
    int sum = 0;
    for (Payment p in payments) {
      if (p.roomId == room.id) {
        sum++;
      }
    }
    return sum;
  }

  int capacity(Room room) {
    for (RoomType roomType in roomTypes) {
      if (roomType.id == room.roomTypeId) {
        final capacity = roomType.capacity;
        if (capacity != null) {
          return capacity;
        }
      }
    }
    return 0;
  }

  bool isRoomAvailable(Room room) {
    return capacity(room) > countPaymentForRoom(room);
  }

  List<Room> get availableRooms {
    return rooms.where((room) => isRoomAvailable(room)).toList();
  }

  bool contains(String? a, String? b) {
    //...

    if (a == null || b == null) return false;

    return a.toLowerCase().contains(b.toLowerCase());
  }

  bool isPassed(Room room, String search) {
    //...

    Floor? floor;

    RoomType? roomType;

    if (room.floorId != null) {
      floor = floors.where((f) => f.id == room.floorId).firstOrNull;
    }

    if (room.roomTypeId != null) {
      roomType = roomTypes.where((rt) => rt.id == room.roomTypeId).firstOrNull;
    }

    if (contains(room.number, search)) {
      return true;
    }

    if (contains(floor?.name, search)) {
      return true;
    }

    if (contains(roomType?.name, search)) {
      return true;
    }

    return false;
  }

  List<Room> roomsByFloor(Floor floor) {
    //...

    List<Room> ls = [];

    for (Room room in availableRooms) {
      if (room.floorId != floor.id) {
        continue;
      }
      if (isPassed(room, searchText)) {
        ls.add(room);
      }
    }

    return ls;
  }

  Future _organiseRoomsForStore() async {
    _roomsByFloors = {
      for (Floor floor in floors) floor: roomsByFloor(floor),
    };
  }

  Future organiseRoomsForStore() async {
    return runBusyFuture(_organiseRoomsForStore());
  }
}

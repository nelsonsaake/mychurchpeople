import 'package:hostels/firestore/collections/rooms.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin SaveRoomViewModelMixin on ContextViewModel {
  //...

  Future<Room> _saveRoom(Room room) async {
    return Rooms.save(room);
  }

  Future<Room> saveRoom(Room room) async {
    return runBusyFuture(_saveRoom(room));
  }
}

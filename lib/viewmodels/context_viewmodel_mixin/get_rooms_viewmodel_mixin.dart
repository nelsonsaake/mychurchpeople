import 'package:hostels/firestore/collections/rooms.dart';
import 'package:hostels/models/room.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetRoomsViewModelMixin on ContextViewModel {
  //....

  static List<Room> _rooms = [];

  List<Room> get rooms => _rooms;

  Future _getRooms() async {
    _rooms = await Rooms.get();
  }

  Future getRooms() async {
    return runBusyFuture(_getRooms());
  }
}

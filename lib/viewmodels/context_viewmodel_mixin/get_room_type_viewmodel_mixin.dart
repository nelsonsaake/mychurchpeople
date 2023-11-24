import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetRoomTypeViewModelMixin on ContextViewModel {
  //....

  RoomType? _roomType;

  RoomType? get roomType => _roomType;

  Future _getRoomType(String? id) async {
    if (id == null) return;
    _roomType = await RoomTypes.find(id);
  }

  Future getRoomType(String? id) async {
    runBusyFuture(_getRoomType(id));
  }
}

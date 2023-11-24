import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin SaveRoomTypeViewModelMixin on ContextViewModel {
  //...

  Future<RoomType> _saveRoomType(RoomType roomType) async {
    return RoomTypes.save(roomType);
  }

  Future<RoomType> saveRoomType(RoomType roomType) async {
    return runBusyFuture(_saveRoomType(roomType));
  }
}

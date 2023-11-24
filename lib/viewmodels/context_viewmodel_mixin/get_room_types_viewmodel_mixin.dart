import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetRoomTypesViewModelMixin on ContextViewModel {
  //....

  static List<RoomType> _roomTypes = [];

  List<RoomType> get roomTypes => _roomTypes;

  Future _getRoomTypes() async {
    _roomTypes = await RoomTypes.get();
  }

  Future getRoomTypes() async {
    return runBusyFuture(_getRoomTypes());
  }
}

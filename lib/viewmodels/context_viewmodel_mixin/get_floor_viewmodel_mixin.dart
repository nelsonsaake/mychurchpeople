import 'package:hostels/firestore/collections/floors.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetFloorViewModelMixin on ContextViewModel {
  //....

  Floor? _floor;

  Floor? get floor => _floor;

  Future _getFloor(String? id) async {
    if (id == null) return;
    _floor = await Floors.find(id);
  }

  Future getFloor(String? id) async {
    runBusyFuture(_getFloor(id));
  }
}

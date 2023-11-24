import 'package:hostels/firestore/collections/floors.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin SaveFloorViewModelMixin on ContextViewModel {
//...

  Future _saveFloor(Floor floor) {
    return Floors.save(floor);
  }

  Future saveFloor(Floor floor) {
    return runBusyFuture(_saveFloor(floor));
  }
}

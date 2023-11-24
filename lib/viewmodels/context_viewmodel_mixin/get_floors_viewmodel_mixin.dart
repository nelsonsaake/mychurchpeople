import 'package:hostels/firestore/collections/floors.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetFloorsViewModelMixin on ContextViewModel {
  //...

  static List<Floor>? _floors;

  List<Floor> get floors => _floors ?? [];

  Future _getFloors() async {
    _floors = await Floors.get();
  }

  Future getFloors() async {
    return runBusyFuture(_getFloors());
  }
}

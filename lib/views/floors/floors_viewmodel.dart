import 'package:flutter/material.dart';
import 'package:hostels/error_interpreter/error_interpreter.dart';
import 'package:hostels/firestore/collections/floors.dart';
import 'package:hostels/helpers/contains.dart';
import 'package:hostels/models/floor.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_floors_viewmodel_mixin.dart';
import 'package:hostels/views/get_delete_confirmation/get_delete_confirmation.dart';

class FloorsViewModel extends ContextViewModel with GetFloorsViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => notifyListeners());

  bool isPass(Floor floor) {
    return contains(floor.toMap().toString(), search.text);
  }

  List<Floor> get filteredFloors {
    return floors.where((floor) => isPass(floor)).toList();
  }

  Future _delete(BuildContext context, Floor floor) async {
    final confirmation = await getDeleteConfirmation(
      context,
      resource: "Floor",
    );
    if (confirmation == true) {
      await Floors.delete(floor.id);
      await getFloors();
    }
  }

  Future delete(BuildContext context, Floor floor) async {
    try {
      await _delete(context, floor);
    } catch (e) {
      showMessage(ErrorInterpreter.interpret(e));
    }
  }

  init() async {
    await getFloors();
  }
}

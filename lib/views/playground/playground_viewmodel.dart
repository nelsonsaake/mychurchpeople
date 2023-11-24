import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hostels/helpers/format_string.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/admins_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestorage_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestore_actions_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_users_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/photo_viewmodel_mixin.dart';

class PlaygroundViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        FirestoreActionsViewModelMixin,
        AdminsViewModelMixin,
        GetRoomsViewModelMixin,
        GetUsersViewModelMixin,
        FirestrogeViewModelMixin,
        PhotoViewModelMixin {
  //...

  dynamic __data;

  get _data => __data;

  set _data(v) {
    __data = v;
    notifyListeners();
  }

  data() {
    //...

    dynamic data = _data;

    try {
      if (data == null) return "";

      dynamic map;
      if (data is List<String>) {
        map = data;
      } else if (data is List) {
        map = data.map((v) => v.toMap()).toList();
      } else {
        map = data?.toMap();
      }

      String prettyJson = const JsonEncoder.withIndent('  ').convert(map);
      return prettyJson;
    } catch (e) {
      //...
      return "$data";
    }
  }

  Future systemReset() async {
    await firestoreinit();
    await fresh();
    await seed();
  }

  Future _getToken() async {
    _data = await FirebaseMessaging.instance.getToken();
  }

  Future getToken() async {
    return runBusyFuture(_getToken());
  }

  onPressed() async {
    //...
    await getToken();
    print(_data);
  }

  init() async {
    //...

    final entries = <dynamic>["start"];

    entries.add(DateTime.now());

    _data = paragraph(entries);

    entries.add("playground initializing");

    _data = paragraph(entries);

    await login("email", "some-secrete-information");

    entries.add("logged in successful");

    _data = paragraph(entries);

    entries.add("playground initialized");

    _data = paragraph(entries);
  }
}

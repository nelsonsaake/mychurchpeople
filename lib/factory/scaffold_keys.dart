import 'package:flutter/material.dart';

class ScaffoldKeys {
  static final List<GlobalKey<ScaffoldState>> _keys = [
    GlobalKey<ScaffoldState>()
  ];

  static GlobalKey<ScaffoldState> get key => _keys.last;

  static GlobalKey<ScaffoldState> get latest => _keys.last;

  static GlobalKey<ScaffoldState> get newKey {
    _keys.add(GlobalKey<ScaffoldState>());
    return key;
  }
}

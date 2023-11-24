import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

mixin PhotoViewModelMixin on ContextViewModel {
  //...

  final GlobalKey photoViewKey = GlobalKey();

  XFile? _photo;

  XFile? get photo => _photo;

  onSetPhoto() {}

  set photo(XFile? v) {
    _photo = v;
    onSetPhoto();
    notifyListeners();
  }

  bool get hasPhoto => _photo != null;

  final ImagePicker _picker = ImagePicker();

  Future _selectPhoto() async {
    final selectPhoto = await _picker.pickImage(source: ImageSource.gallery);
    photo = selectPhoto ?? photo;
  }

  Future _takePhoto() async {
    final cameraPhoto = await _picker.pickImage(source: ImageSource.camera);
    photo = cameraPhoto ?? photo;
  }

  Future selectPhoto() {
    return runBusyFuture(_selectPhoto());
  }

  Future takePhoto() {
    return runBusyFuture(_takePhoto());
  }

  File? get photoAsFile {
    final path = photo?.path;
    if (path == null) return null;
    return File(path);
  }
}

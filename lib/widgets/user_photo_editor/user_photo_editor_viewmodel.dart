import 'dart:io';

import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/photo_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestorage_viewmodel_mixin.dart';

class UserPhotoEditorViewModel extends ContextViewModel
    with
        PhotoViewModelMixin,
        FirestrogeViewModelMixin,
        FirebaseAuthViewModelMixin {
  //...

  Future uploadPhoto() async {
    //...

    final path = photo?.path;
    if (path == null) return;

    final name = photo?.name;
    if (name == null) return;

    final File file = File(path);
    await uploadFile(file, name: name);

    notifyListeners();
  }

  @override
  onSetPhoto() async {
    //...

    String? oldPhoto = user?.photoURL;

    await uploadPhoto();

    if (hasError) return;

    await updateUserPhoto(uploadedFileUrl);

    if (hasError) return;

    await deleteFile(oldPhoto);
  }
}

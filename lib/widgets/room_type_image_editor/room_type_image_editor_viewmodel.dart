import 'dart:io';

import 'package:hostels/firestore/collections/room_types.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestorage_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/photo_viewmodel_mixin.dart';

class RoomTypeImageEditorViewModel extends ContextViewModel
    with PhotoViewModelMixin, FirestrogeViewModelMixin {
  //...

  String? get uploadedImageUrl => uploadedFileUrl;

  RoomTypeImageEditorViewModel(this.roomType);

  RoomType? roomType;

  bool get hasImage => roomType?.image != null;

  String? get image => roomType?.image;

  Future uploadImage() async {
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

    String? oldImage = roomType?.image;

    await uploadImage();

    if (hasError) return;

    roomType = roomType?.copyWith(image: uploadedImageUrl);

    if (roomType != null) {
      await RoomTypes.save(roomType!);
    }

    if (hasError) return;

    await deleteFile(oldImage);
  }
}

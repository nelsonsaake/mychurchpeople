import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin FirestrogeViewModelMixin on ContextViewModel {
  //...

  Reference? _uploadFileRef;

  Reference? get uploadFileRef => _uploadFileRef;

  String? _uploadedFileUrl;

  String? get uploadedFileUrl => _uploadedFileUrl;

  UploadTask? _uploadTask;

  TaskSnapshot? _taskSnapshot;

  double uploadPercentage = 0;

  TaskState? uploadState;

  String get timeStamp {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Reference get rootRef {
    return FirebaseStorage.instance.ref();
  }

  Reference get baseRef {
    return rootRef.child('images');
  }

  Reference newRef({String? name, String? ext}) {
    name ??= '$timeStamp.${ext ?? 'jpg'}';
    return baseRef.child('/$name');
  }

  Future _uploadFile(File file, {String? name, String? ext}) async {
    //...

    _uploadFileRef = newRef(name: name, ext: ext);

    _uploadTask = _uploadFileRef!.putFile(file);

    _uploadTask?.asStream().forEach((v) {
      uploadPercentage = v.bytesTransferred / v.totalBytes;
      uploadState = v.state;
      notifyListeners();
    });

    _taskSnapshot = await _uploadTask?.whenComplete(() => null);

    _uploadedFileUrl = await _taskSnapshot?.ref.getDownloadURL();
  }

  Future uploadFile(File? file, {String? name, String? ext}) async {
    if (file == null) return;
    return runBusyFuture(_uploadFile(file, name: name, ext: ext));
  }

  Future _deleteFile(String url) async {
    final name = Uri.parse(url).pathSegments.last;
    await rootRef.child(name).delete();
  }

  Future deleteFile(String? url) async {
    if (url == null) return;
    return runBusyFuture(_deleteFile(url));
  }
}

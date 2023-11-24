import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetFcmTokenViewModelMixin on ContextViewModel {
  //...

  static String? _fcmToken;

  String? get fcmToken => _fcmToken;

  Future _getFcmToken() async {
    _fcmToken = await FirebaseMessaging.instance.getToken();
  }

  Future getFcmToken() async {
    return runBusyFuture(_getFcmToken());
  }
}

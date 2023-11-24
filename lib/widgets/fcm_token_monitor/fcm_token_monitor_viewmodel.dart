import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hostels/models/device.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_device_type_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_fcm_token_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/register_device_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/update_device_viewmodel_mixin.dart';

class FcmTokenMonitorViewModel extends ContextViewModel
    with
        RegisterDeviceViewModelMixin,
        UpdateDeviceViewModelMixin,
        GetFcmTokenViewModelMixin,
        GetDeviceTypeViewModelMixin {
  //...

  Stream<String>? _tokenStream;

  Device currentDevice(String? token) {
    return Device(
      userId: 1,
      token: token,
      deviceType: deviceType,
    );
  }

  Future updateToken(String token) {
    return updateDevice(currentDevice(token));
  }

  init() async {
    //...

    await getFcmToken();

    await registerDevice(currentDevice(fcmToken));

    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;

    _tokenStream?.listen(updateToken);
  }
}

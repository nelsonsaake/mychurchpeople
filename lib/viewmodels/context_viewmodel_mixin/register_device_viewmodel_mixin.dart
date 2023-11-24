import 'package:dio/dio.dart';
import 'package:hostels/models/device.dart';
import 'package:hostels/notifications/clients/notifications_client.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin RegisterDeviceViewModelMixin on ContextViewModel {
  //...

  static Device? _registeredDevice;

  Device? get registeredDevice => _registeredDevice;

  NotificationClient get _client {
    final dio = Dio();
    return NotificationClient(dio);
  }

  Future _registerDevice(Device device) async {
    _registeredDevice = await _client.registerDevice(device);
  }

  Future registerDevice(Device device) {
    return runBusyFuture(_registerDevice(device));
  }
}

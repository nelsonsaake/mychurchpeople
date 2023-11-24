import 'package:dio/dio.dart';
import 'package:hostels/models/device.dart';
import 'package:hostels/notifications/clients/notifications_client.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin UpdateDeviceViewModelMixin on ContextViewModel {
  //...

  Device? _updatedDevice;

  Device? get updatedDevice => _updatedDevice;

  NotificationClient get _client {
    final dio = Dio();
    return NotificationClient(dio);
  }

  Future _updateDevice(Device device) async {
    _updatedDevice = await _client.updateDevice(device);
  }

  Future updateDevice(Device device) async {
    return runBusyFuture(_updateDevice(device));
  }
}

import 'package:dio/dio.dart';
import 'package:hostels/models/device.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_client.g.dart';

@RestApi(baseUrl: '')
abstract class NotificationClient {
  //...

  factory NotificationClient(Dio dio, {String? baseUrl}) = _NotificationClient;

  @POST("/devices")
  Future<Device> registerDevice(@Body() Device device);

  @PUT("/devices")
  Future<Device> updateDevice(@Body() Device device);
}

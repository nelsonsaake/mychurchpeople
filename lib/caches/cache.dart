import 'package:hostels/caches/cache_with_session_storage.dart';

class Cache {
  // mobile

  static final _cachedData = CacheWithSessionStorage<String>("#1");

  static String get data => _cachedData.get() ?? "";

  static set data(String v) => _cachedData.set(v);

  // is push notification setup data

  static final _isPushNotificationSetupData =
      CacheWithSessionStorage<bool>("#2");

  static bool? get isPushNotificationSetup =>
      _isPushNotificationSetupData.get();

  static set isPushNotificationSetup(bool? v) =>
      _isPushNotificationSetupData.set(v);
}

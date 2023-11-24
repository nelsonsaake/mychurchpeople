import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hostels/caches/cache.dart';

Future requestNotificationPermissions() async {
  if (Cache.isPushNotificationSetup == true) return;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings =
      await messaging.requestPermission(alert: true, badge: true, sound: true);

  Cache.isPushNotificationSetup =
      settings.authorizationStatus == AuthorizationStatus.authorized;
}

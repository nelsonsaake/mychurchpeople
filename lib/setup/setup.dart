import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:hostels/app/app.locator.dart';
import 'package:hostels/caches/cache_firestore_credentails.dart';
import 'package:hostels/caches/cache_with_session_storage.dart';
import 'package:hostels/firebase_options.dart';
import 'package:hostels/firestore/firestore_config.dart';
import 'package:hostels/permissions/request_notification_permissions.dart';

Future<void> setup() async {
  // wait for framework to finish init
  WidgetsFlutterBinding.ensureInitialized();

  // setup locator
  await setupLocator();

  // setup shared preferences
  await CacheWithSessionStorage.init();

  // use this to manage users
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // use this to manage the firestore records
  FirebaseAuth.initialize(FirestoreConfig.apiKey, CachedTokenStore());

  // connect firestore to a project
  Firestore.initialize(FirestoreConfig.projectId);
}

Future requestPermissions() async {
  // request, will only request permission once
  await requestNotificationPermissions();
}

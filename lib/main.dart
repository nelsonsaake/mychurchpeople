import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/setup/setup.dart';
import 'package:hostels/theme/theme.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setup().then((_) {
    return runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: StringResources.appName,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      builder: (context, child) {
        return FutureBuilder(
          future: requestPermissions(),
          builder: (context, snapshot) {
            return Container(
              child: child,
            );
          },
        );
      },
      initialRoute: [
        Routes.playgroundView,
        Routes.roomTypesView,
        Routes.profileView,
        Routes.storeView,
        Routes.paymentsView,
        Routes.loginView,
        Routes.myRoomView,
        Routes.roomTypesView,
        Routes.createRoomTypeView,
        Routes.floorsView,
        Routes.createRoomView,
        Routes.roomsView,
        Routes.registerView,
        Routes.verifyEmailView,
      ].first,
    );
  }
}

// REFERENCES
// reset() => package:hostels/views/playground/playground_viewmodel.dart/systemReset()

// HOW TO GET IT UP AND RUNING
// to reset the system run reset()
// once you're logged in as admin, you have full control
// to become an root admin(admin that comes with the app): 
//    1. add your email to the seed_users.dart,
//    2. reset the system by runing reset() to lock in your credentials 
//    3. register you account like a regular user,
//       after this: the system recognise your login as admin.

// PLAYGROUND 
// if you need to do one time runs that don't fit any flow, you can use the playground
// eg. reset()
//     reset clears everything so we don't want it to be available at runtime
//
// playground is also good for testing stuff or in developing stuff
// eg. you want to see what token looks like
//     you want to see raw response coming from api

// TODOS
// add photos to roomTypesView
// add room photo to my room view
// edit room type > reload the page when photo is editted
// add a photo picker to create room view
// splash screen and logo
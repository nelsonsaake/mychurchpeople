import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';

final theme = ThemeData(
  //...

  colorSchemeSeed: ColorResources.dark,

  appBarTheme: const AppBarTheme(
    //...

    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),

    backgroundColor: ColorResources.green,

    foregroundColor: Colors.white,

    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  drawerTheme: DrawerThemeData(
    //...

    backgroundColor: ColorResources.dark,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
  ),

  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16.0),
  ),

  useMaterial3: true,
);

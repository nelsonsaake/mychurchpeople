// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i23;
import 'package:flutter/material.dart';
import 'package:hostels/models/floor.dart' as _i25;
import 'package:hostels/models/room.dart' as _i24;
import 'package:hostels/models/room_type.dart' as _i26;
import 'package:hostels/views/about/about_view.dart' as _i22;
import 'package:hostels/views/create_floor/create_floor_view.dart' as _i15;
import 'package:hostels/views/create_room/create_room_view.dart' as _i12;
import 'package:hostels/views/create_room_type/create_room_type_view.dart'
    as _i18;
import 'package:hostels/views/edit_floor/edit_floor_view.dart' as _i16;
import 'package:hostels/views/edit_room/edit_room_view.dart' as _i13;
import 'package:hostels/views/edit_room_type/edit_room_type_view.dart' as _i19;
import 'package:hostels/views/floors/floors_view.dart' as _i14;
import 'package:hostels/views/forgot_password/forgot_password_view.dart' as _i4;
import 'package:hostels/views/login/login_view.dart' as _i5;
import 'package:hostels/views/my_room/my_room_view.dart' as _i21;
import 'package:hostels/views/payments/payments_view.dart' as _i20;
import 'package:hostels/views/playground/playground_view.dart' as _i9;
import 'package:hostels/views/profile/profile_view.dart' as _i10;
import 'package:hostels/views/register/register_view.dart' as _i6;
import 'package:hostels/views/reset_password/reset_password_view.dart' as _i7;
import 'package:hostels/views/room_types/room_types_view.dart' as _i17;
import 'package:hostels/views/rooms/rooms_view.dart' as _i3;
import 'package:hostels/views/store/store_view.dart' as _i2;
import 'package:hostels/views/users/users_view.dart' as _i11;
import 'package:hostels/views/verify_emal/verify_email_view.dart' as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i27;

class Routes {
  static const storeView = '/store-view';

  static const roomsView = '/rooms-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const resetPasswordView = '/reset-password-view';

  static const verifyEmailView = '/verify-email-view';

  static const playgroundView = '/playground-view';

  static const profileView = '/profile-view';

  static const usersView = '/users-view';

  static const createRoomView = '/create-room-view';

  static const editRoomView = '/edit-room-view';

  static const floorsView = '/floors-view';

  static const createFloorView = '/create-floor-view';

  static const editFloorView = '/edit-floor-view';

  static const roomTypesView = '/room-types-view';

  static const createRoomTypeView = '/create-room-type-view';

  static const editRoomTypeView = '/edit-room-type-view';

  static const paymentsView = '/payments-view';

  static const myRoomView = '/my-room-view';

  static const aboutView = '/about-view';

  static const all = <String>{
    storeView,
    roomsView,
    forgotPasswordView,
    loginView,
    registerView,
    resetPasswordView,
    verifyEmailView,
    playgroundView,
    profileView,
    usersView,
    createRoomView,
    editRoomView,
    floorsView,
    createFloorView,
    editFloorView,
    roomTypesView,
    createRoomTypeView,
    editRoomTypeView,
    paymentsView,
    myRoomView,
    aboutView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.storeView,
      page: _i2.StoreView,
    ),
    _i1.RouteDef(
      Routes.roomsView,
      page: _i3.RoomsView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i4.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i6.RegisterView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i7.ResetPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyEmailView,
      page: _i8.VerifyEmailView,
    ),
    _i1.RouteDef(
      Routes.playgroundView,
      page: _i9.PlaygroundView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i10.ProfileView,
    ),
    _i1.RouteDef(
      Routes.usersView,
      page: _i11.UsersView,
    ),
    _i1.RouteDef(
      Routes.createRoomView,
      page: _i12.CreateRoomView,
    ),
    _i1.RouteDef(
      Routes.editRoomView,
      page: _i13.EditRoomView,
    ),
    _i1.RouteDef(
      Routes.floorsView,
      page: _i14.FloorsView,
    ),
    _i1.RouteDef(
      Routes.createFloorView,
      page: _i15.CreateFloorView,
    ),
    _i1.RouteDef(
      Routes.editFloorView,
      page: _i16.EditFloorView,
    ),
    _i1.RouteDef(
      Routes.roomTypesView,
      page: _i17.RoomTypesView,
    ),
    _i1.RouteDef(
      Routes.createRoomTypeView,
      page: _i18.CreateRoomTypeView,
    ),
    _i1.RouteDef(
      Routes.editRoomTypeView,
      page: _i19.EditRoomTypeView,
    ),
    _i1.RouteDef(
      Routes.paymentsView,
      page: _i20.PaymentsView,
    ),
    _i1.RouteDef(
      Routes.myRoomView,
      page: _i21.MyRoomView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i22.AboutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StoreView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StoreView(),
        settings: data,
      );
    },
    _i3.RoomsView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.RoomsView(),
        settings: data,
      );
    },
    _i4.ForgotPasswordView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ForgotPasswordView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.RegisterView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.RegisterView(),
        settings: data,
      );
    },
    _i7.ResetPasswordView: (data) {
      final args = data.getArgs<ResetPasswordViewArguments>(
        orElse: () => const ResetPasswordViewArguments(),
      );
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.ResetPasswordView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i8.VerifyEmailView: (data) {
      final args = data.getArgs<VerifyEmailViewArguments>(
        orElse: () => const VerifyEmailViewArguments(),
      );
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.VerifyEmailView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i9.PlaygroundView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.PlaygroundView(),
        settings: data,
      );
    },
    _i10.ProfileView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ProfileView(),
        settings: data,
      );
    },
    _i11.UsersView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.UsersView(),
        settings: data,
      );
    },
    _i12.CreateRoomView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.CreateRoomView(),
        settings: data,
      );
    },
    _i13.EditRoomView: (data) {
      final args = data.getArgs<EditRoomViewArguments>(nullOk: false);
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.EditRoomView(args.room, key: args.key),
        settings: data,
      );
    },
    _i14.FloorsView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.FloorsView(),
        settings: data,
      );
    },
    _i15.CreateFloorView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.CreateFloorView(),
        settings: data,
      );
    },
    _i16.EditFloorView: (data) {
      final args = data.getArgs<EditFloorViewArguments>(nullOk: false);
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.EditFloorView(args.floor, key: args.key),
        settings: data,
      );
    },
    _i17.RoomTypesView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.RoomTypesView(),
        settings: data,
      );
    },
    _i18.CreateRoomTypeView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.CreateRoomTypeView(),
        settings: data,
      );
    },
    _i19.EditRoomTypeView: (data) {
      final args = data.getArgs<EditRoomTypeViewArguments>(nullOk: false);
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i19.EditRoomTypeView(args.roomType, key: args.key),
        settings: data,
      );
    },
    _i20.PaymentsView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.PaymentsView(),
        settings: data,
      );
    },
    _i21.MyRoomView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.MyRoomView(),
        settings: data,
      );
    },
    _i22.AboutView: (data) {
      return _i23.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.AboutView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ResetPasswordViewArguments {
  const ResetPasswordViewArguments({
    this.key,
    this.email,
  });

  final _i23.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant ResetPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class VerifyEmailViewArguments {
  const VerifyEmailViewArguments({
    this.key,
    this.email,
  });

  final _i23.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant VerifyEmailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class EditRoomViewArguments {
  const EditRoomViewArguments({
    required this.room,
    this.key,
  });

  final _i24.Room room;

  final _i23.Key? key;

  @override
  String toString() {
    return '{"room": "$room", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditRoomViewArguments other) {
    if (identical(this, other)) return true;
    return other.room == room && other.key == key;
  }

  @override
  int get hashCode {
    return room.hashCode ^ key.hashCode;
  }
}

class EditFloorViewArguments {
  const EditFloorViewArguments({
    required this.floor,
    this.key,
  });

  final _i25.Floor floor;

  final _i23.Key? key;

  @override
  String toString() {
    return '{"floor": "$floor", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditFloorViewArguments other) {
    if (identical(this, other)) return true;
    return other.floor == floor && other.key == key;
  }

  @override
  int get hashCode {
    return floor.hashCode ^ key.hashCode;
  }
}

class EditRoomTypeViewArguments {
  const EditRoomTypeViewArguments({
    required this.roomType,
    this.key,
  });

  final _i26.RoomType roomType;

  final _i23.Key? key;

  @override
  String toString() {
    return '{"roomType": "$roomType", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditRoomTypeViewArguments other) {
    if (identical(this, other)) return true;
    return other.roomType == roomType && other.key == key;
  }

  @override
  int get hashCode {
    return roomType.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i27.NavigationService {
  Future<dynamic> navigateToStoreView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.storeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRoomsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.roomsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView({
    _i23.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        arguments: ResetPasswordViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyEmailView({
    _i23.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyEmailView,
        arguments: VerifyEmailViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlaygroundView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.playgroundView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.usersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditRoomView({
    required _i24.Room room,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editRoomView,
        arguments: EditRoomViewArguments(room: room, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFloorsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.floorsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateFloorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createFloorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditFloorView({
    required _i25.Floor floor,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editFloorView,
        arguments: EditFloorViewArguments(floor: floor, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRoomTypesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.roomTypesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateRoomTypeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createRoomTypeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditRoomTypeView({
    required _i26.RoomType roomType,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editRoomTypeView,
        arguments: EditRoomTypeViewArguments(roomType: roomType, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paymentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStoreView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.storeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRoomsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.roomsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordView({
    _i23.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resetPasswordView,
        arguments: ResetPasswordViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyEmailView({
    _i23.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyEmailView,
        arguments: VerifyEmailViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlaygroundView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.playgroundView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.usersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditRoomView({
    required _i24.Room room,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editRoomView,
        arguments: EditRoomViewArguments(room: room, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFloorsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.floorsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateFloorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createFloorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditFloorView({
    required _i25.Floor floor,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editFloorView,
        arguments: EditFloorViewArguments(floor: floor, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRoomTypesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.roomTypesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateRoomTypeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createRoomTypeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditRoomTypeView({
    required _i26.RoomType roomType,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editRoomTypeView,
        arguments: EditRoomTypeViewArguments(roomType: roomType, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paymentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

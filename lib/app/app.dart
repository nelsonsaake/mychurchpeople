import 'package:hostels/views/create_floor/create_floor_view.dart';
import 'package:hostels/views/create_room/create_room_view.dart';
import 'package:hostels/views/create_room_type/create_room_type_view.dart';
import 'package:hostels/views/edit_floor/edit_floor_view.dart';
import 'package:hostels/views/edit_room/edit_room_view.dart';
import 'package:hostels/views/edit_room_type/edit_room_type_view.dart';
import 'package:hostels/views/floors/floors_view.dart';
import 'package:hostels/views/forgot_password/forgot_password_view.dart';
import 'package:hostels/views/login/login_view.dart';
import 'package:hostels/views/my_room/my_room_view.dart';
import 'package:hostels/views/payments/payments_view.dart';
import 'package:hostels/views/playground/playground_view.dart';
import 'package:hostels/views/profile/profile_view.dart';
import 'package:hostels/views/register/register_view.dart';
import 'package:hostels/views/reset_password/reset_password_view.dart';
import 'package:hostels/views/room_types/room_types_view.dart';
import 'package:hostels/views/rooms/rooms_view.dart';
import 'package:hostels/views/store/store_view.dart';
import 'package:hostels/views/users/users_view.dart';
import 'package:hostels/views/about/about_view.dart';
import 'package:hostels/views/verify_emal/verify_email_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StoreView),
    MaterialRoute(page: RoomsView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: VerifyEmailView),
    MaterialRoute(page: PlaygroundView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: UsersView),
    MaterialRoute(page: CreateRoomView),
    MaterialRoute(page: EditRoomView),
    MaterialRoute(page: FloorsView),
    MaterialRoute(page: CreateFloorView),
    MaterialRoute(page: EditFloorView),
    MaterialRoute(page: RoomTypesView),
    MaterialRoute(page: CreateRoomTypeView),
    MaterialRoute(page: EditRoomTypeView),
    MaterialRoute(page: PaymentsView),
    MaterialRoute(page: MyRoomView),
    MaterialRoute(page: AboutView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    // LazySingleton(classType: DialogService),
    // LazySingleton(classType: BottomSheetService),
  ],
)
class App {}

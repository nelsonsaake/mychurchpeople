import 'package:flutter/material.dart';
import 'package:hostels/models/user.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/admins_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_users_viewmodel_mixin.dart';
import 'package:hostels/views/get_confirmation/get_confirmation.dart';

class UsersViewModel extends ContextViewModel
    with GetUsersViewModelMixin, AdminsViewModelMixin {
  //...

  final searchKey = GlobalKey();

  late TextEditingController search = TextEditingController()
    ..addListener(() => notifyListeners());

  List<AppUser> get filteredUsers {
    return users.where(
      (v) {
        return "${v.toMap()}".toLowerCase().contains(search.text.toLowerCase());
      },
    ).toList();
  }

  String get searchText => search.text;

  Future _toggleAdminStatus(AppUser appUser) async {
    final email = appUser.email;
    if (email == null) return;
    await toggleIsAdmin(email);
    await getUsers();
  }

  Future toggleAdminStatus(BuildContext context, AppUser appUser) async {
    const message = "Are you show you want to change user's admin status?";
    final confirmation = await getConfirmation(context, message);
    if (confirmation == true) {
      return runBusyFuture(_toggleAdminStatus(appUser), busyObject: appUser);
    }
  }

  bool isAppUserUpdating(AppUser appUser) => busy(appUser);

  init() async {
    await getUsers();
  }
}

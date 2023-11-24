import 'package:hostels/firestore/collections/users.dart';
import 'package:hostels/models/user.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetUsersViewModelMixin on ContextViewModel {
  //...

  List<AppUser> _users = [];

  List<AppUser> get users => _users;

  Future _getUsers() async {
    _users = await Users.get();
  }

  Future getUsers() async {
    return runBusyFuture(_getUsers());
  }
}

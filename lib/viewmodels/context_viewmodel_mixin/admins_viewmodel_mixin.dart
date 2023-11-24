import 'package:hostels/firestore/collections/users.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin AdminsViewModelMixin on ContextViewModel {
  // toogle add access

  // Map<email, isAdmin>
  static final Map<String, bool> _adminStatus = {};

  bool? isAdmin(email) => _adminStatus[email];

  Future _getIsAdmin(String email) async {
    _adminStatus[email] = await Users.isAdmin(email);
  }

  Future getIsAdmin(String email) async {
    return runBusyFuture(_getIsAdmin(email));
  }

  Future _toggleIsAdmin(String email) async {
    _adminStatus[email] = await Users.toggleIsAmin(email);
  }

  Future toggleIsAdmin(String email) async {
    return runBusyFuture(_toggleIsAdmin(email));
  }
}

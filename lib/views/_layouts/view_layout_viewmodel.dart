import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/admins_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class ViewLayoutViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin, AdminsViewModelMixin {
  //...

  bool get isAdminLoggedIn {
    final email = user?.email;
    return isAdmin(email) == true;
  }

  bool get showDrawerButton => isAdminLoggedIn;

  String get userEmail => user?.email ?? "";

  String get userName => user?.displayName ?? "";

  init() async {
    final email = user?.email;
    if (email != null) {
      await getIsAdmin(email);
    }
  }
}

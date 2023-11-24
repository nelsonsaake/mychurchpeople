import 'package:firebase_auth/firebase_auth.dart';
import 'package:firedart/firedart.dart' as fd;
import 'package:hostels/firestore/collections/users.dart';
import 'package:hostels/firestore/firestore_config.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/models/user.dart' as fd;

mixin FirebaseAuthViewModelMixin on ContextViewModel {
  //...

  User? get user => FirebaseAuth.instance.currentUser;

  // is logged in

  bool get isLoggedIn => user != null;

  // is email verified

  bool get isEmailVerified => user?.emailVerified == true;

  // does user have verified

  bool get doesUserHavePhoto => user?.photoURL != null;

  // register

  Future _register(String email, String password, [String? name]) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    await Users.save(fd.AppUser(email: email, name: name));
    await _firedartLogin(email, password);
  }

  Future register(String email, String password, [String? name]) {
    return runBusyFuture(_register(email, password, name));
  }

  // send email verification

  Future _sendEmailVerification() async {
    await user?.sendEmailVerification();
  }

  Future sendEmailVerification() async {
    return runBusyFuture(_sendEmailVerification());
  }

  // send password reset email

  Future _sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future sendPasswordResetEmail(String email) async {
    return runBusyFuture(_sendPasswordResetEmail(email));
  }

  // login

  Future _login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    await _firedartLogin(email, password);
  }

  Future login(String email, String password) {
    return runBusyFuture(_login(email, password));
  }

  // logout

  Future _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future logout() async {
    return runBusyFuture(_logout());
  }

  // firedart login

  Future _firedartLogin(String email, String password) async {
    await fd.FirebaseAuth.instance.signIn(email, password);
  }

  // def firedart login

  Future firestoreinit() async {
    await _firedartLogin(FirestoreConfig.email, FirestoreConfig.password);
  }

  // refresh user data

  Future _refreshUserData() async {
    await FirebaseAuth.instance.currentUser?.reload();
  }

  Future refreshUserData() {
    return runBusyFuture(_refreshUserData());
  }

  // update user info

  Future _updateDisplayName(String displayName) async {
    await user?.updateDisplayName(displayName);
    await Users.updateDisplayName(user?.email, displayName);
    await refreshUserData();
  }

  Future updateDisplayName(String displayName) async {
    return runBusyFuture(_updateDisplayName(displayName));
  }

  // update user photo

  Future _updateUserPhoto(String url) async {
    await user?.updatePhotoURL(url);
    await Users.updatePhotoURL(user?.email, url);
    await refreshUserData();
  }

  Future updateUserPhoto(String? url) async {
    if (url == null) return;
    return runBusyFuture(_updateUserPhoto(url));
  }
}

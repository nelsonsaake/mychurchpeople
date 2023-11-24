import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorInterpreter {
//...

  String interpret(FirebaseAuthException exception) {
    return exception.message ?? "Something went wrong";
  }
}

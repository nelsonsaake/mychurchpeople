import 'package:firedart/firedart.dart';

class GrpcErrorInterpreter {
  //...

  static String noInternetErrorSignature() {
    return "Failed host lookup";
  }

  static bool contains(String? s1, String? s2) {
    if (s1 == null || s2 == null) return false;
    return s1.toLowerCase().contains(s2.toLowerCase());
  }

  String interpret(GrpcError e) {
    if (contains(e.message, noInternetErrorSignature())) {
      return "You are currently offline.";
    }
    return "Something went wrong";
  }
}

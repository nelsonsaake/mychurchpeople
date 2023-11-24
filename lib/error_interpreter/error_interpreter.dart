import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firedart/firedart.dart';
import 'package:hostels/error_interpreter/firebase_error_interpreter.dart';
import 'package:hostels/error_interpreter/grpc_error_interpreter.dart';

import 'dio_error_interpreter.dart';

class ErrorInterpreter {
  // for handling unknown exceptions

  static String interpretException(Exception e) {
    return "error 234: please contact developer: \n$e";
  }

  // decide how the error should be interpreted

  static String interpret(e) {
    switch (e.runtimeType) {
      case String:
        return e;
      case DioException:
        return DioExceptionInterpreter().interpret(e);
      case FirebaseAuthException:
        return FirebaseErrorInterpreter().interpret(e);
      case Exception:
        return interpretException(e);
      case GrpcError:
        return GrpcErrorInterpreter().interpret(e);
      default:
        return "unknown error: $e";
    }
  }
}

import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptionInterpreter {
  //...

  String interpretErrorResponse(DioException dioError) {
    if (dioError.response?.data is Map<String, dynamic>) {
      return dioError.response?.data["message"] ??
          dioError.response?.data["errors"];
    }

    return dioError.message ?? "";
  }

  String interpretInnerError(DioException dioError) {
    switch (dioError.error.runtimeType) {
      case SocketException:
        final err = dioError.error as SocketException;
        return err.message.trim();
      default:
        return dioError.message ?? "";
    }
  }

  String interpret(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType
            .connectionTimeout: // It occurs when url is opened timeout.
      case DioExceptionType.sendTimeout: // It occurs when url is sent timeout.
      case DioExceptionType.receiveTimeout: // It occurs when receiving timeout.
        return "Please check your internet connection.";

      case DioExceptionType.badResponse:
        // server response, but with a incorrect status, such as 404, 503...
        return interpretErrorResponse(dioError);

      case DioExceptionType.cancel:
        // When the request is cancelled, dio will throw a error with this type.
        return "Request was cancelled";

      case DioExceptionType.unknown:
        // "Default error type, Some other Error. In this case, you can \n"
        // "use the DioException.error if it is not null."
        return interpretInnerError(dioError);

      default:
        return "Something went wrong";
    }
  }
}

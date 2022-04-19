import 'package:flutter/services.dart';

import 'exceptions.dart';

Never translatePlatformException(PlatformException error) {
  if (error.code.startsWith("lib-")) {
    final code = error.code.substring(4);
    switch (code) {
      case "BadMarshal":
        throw BadMarshalError.fromPlatformException(error);
      case "BadEnum":
        throw BadEnumError.fromPlatformException(error);
      case "InvalidInstanceId":
        throw InvalidInstanceIdError.fromPlatformException(error);
      case "Unknown":
        throw UnexpectedError.fromPlatformException(error);
      default:
        throw error;
    }
  }

  if (error.code.startsWith("EPOS2_ERR_")) {
    throw Epos2Exception.fromPlatformException(error);
  }

  throw error;
}

extension PlatformExceptionFutureExtension<T> on Future<T> {
  Future<T> handlePlatformException() async {
    try {
      return await this;
    } on PlatformException catch (err) {
      translatePlatformException(err);
    }
  }
}

Never throwBadEnumError(String name, dynamic value, String methodName) {
  throw BadEnumError("$name = $value", methodName);
}

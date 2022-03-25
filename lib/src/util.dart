import 'package:flutter/services.dart';

import 'exceptions.dart';

void check(bool condition, String message) {
  if (!condition) {
    throw AssertionError(message);
  }
}

T checkNotNull<T>(T? value, [String? message]) {
  if (value == null) {
    throw AssertionError(message ?? "Unexpected null value");
  }

  return value;
}

extension PlatformExceptionExtension<T> on Future<T> {
  Future<T> translatePlatformException() async {
    try {
      return await this;
    } on PlatformException catch (err) {
      if (err.code.startsWith("EPOS2")) {
        throw Epos2Exception(
          err.code,
          details: err.details?.toString(),
          nativeStackTrace: err.stacktrace,
        );
      }

      if (err.code == "library") {
        if (err.stacktrace != null) {
          Error.throwWithStackTrace(
            AssertionError(err.message),
            StackTrace.fromString(err.stacktrace!),
          );
        }

        throw AssertionError(err.message);
      }

      rethrow;
    }
  }
}

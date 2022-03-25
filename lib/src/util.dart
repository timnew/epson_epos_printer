import 'package:flutter/services.dart';

import 'exceptions.dart';

void check(bool condition, String message) {
  if (!condition) {
    throw EposError.unexpected(message);
  }
}

T checkNotNull<T>(T? value, [String? message]) {
  if (value == null) {
    throw EposError.unexpected(message ?? "Unexpected null value");
  }

  return value;
}

extension PlatformExceptionExtension<T> on Future<T> {
  Future<T> translatePlatformException() async {
    try {
      return await this;
    } on PlatformException catch (err) {
      throw EposError(
        err.code,
        err.message ?? "unknown error",
        err.details?.toString(),
      );
    }
  }
}

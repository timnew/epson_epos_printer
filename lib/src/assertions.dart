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

int checkInRange(int value, String name, int min, int max) {
  if (value < min || value > max) {
    throw RangeError.range(value, min, max, name,
        "Given $name $value is out of valid range $min to $max");
  }

  return value;
}

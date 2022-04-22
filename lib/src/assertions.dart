void check(bool condition, String message) {
  if (!condition) {
    throw AssertionError(message);
  }
}

extension NullableExtension<T> on T? {
  T checkNotNull([String? message]) {
    final value = this;

    if (value == null) {
      throw AssertionError(message ?? "Unexpected null value");
    }

    return value;
  }

  T requireNotNull([String? name]) {
    final value = this;

    if (value == null) {
      throw ArgumentError.notNull(name);
    }

    return value;
  }
}

int checkInRange(int value, String name, int min, int max) {
  if (value < min || value > max) {
    throw RangeError.range(value, min, max, name,
        "Given $name $value is out of valid range $min to $max");
  }

  return value;
}

class EposError extends Error {
  final String code;
  final String message;
  final String? details;

  EposError(this.code, this.message, [this.details]);

  factory EposError.unexpected(String message) =>
      EposError('unexpected', message);

  @override
  String toString() {
    final basic = "EposError[$code]: $message";
    if (details == null) return basic;

    return "$basic\n  Details: $details";
  }
}

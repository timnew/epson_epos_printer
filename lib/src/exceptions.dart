class EposError extends Error {
  final String message;

  EposError(this.message);

  @override
  String toString() => "EposError: $message";
}

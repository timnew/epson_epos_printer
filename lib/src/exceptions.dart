class Epos2Exception implements Exception {
  final String code;
  final String? details;
  final String? nativeStackTrace;

  Epos2Exception(this.code, {this.details, this.nativeStackTrace});

  @override
  String toString() => [
        "Epos2Exception: $code",
        if (details != null) "  Details: $details",
        if (nativeStackTrace != null) "\n$nativeStackTrace",
      ].join("\n");
}

import 'package:flutter/services.dart';

import 'printer.dart';

class Epos2Exception implements Exception {
  final String code;
  final String message;

  Epos2Exception(this.code, this.message);
  factory Epos2Exception.fromPlatformException(PlatformException err) =>
      Epos2Exception(
        err.code,
        err.message!,
      );

  @override
  String toString() => "Epos2Exception $code: $message";
}

class Epos2AsyncException extends Epos2Exception {
  final Epos2PrinterStatusInfo printerStatus;

  Epos2AsyncException(String code, String message, this.printerStatus)
      : super(code, message);
  factory Epos2AsyncException.fromPlatformException(PlatformException err) =>
      Epos2AsyncException(
        err.code,
        err.message!,
        Epos2PrinterStatusInfo.fromJson(
          (err.details as Map).cast(),
        ),
      );
}

class BadMarshalError extends Error {
  final String message;

  BadMarshalError(this.message);
  factory BadMarshalError.fromPlatformException(PlatformException err) =>
      BadMarshalError(err.message!);

  @override
  String toString() => "BadMarshalError: $message";
}

class BadEnumError extends Error {
  final String message;
  final String details;

  BadEnumError(this.message, this.details);
  factory BadEnumError.fromPlatformException(PlatformException err) =>
      BadEnumError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => "BadEnumError: $message";
}

class InvalidInstanceIdError extends Error {
  final String message;
  final String id;

  InvalidInstanceIdError(this.message, this.id);
  factory InvalidInstanceIdError.fromPlatformException(PlatformException err) =>
      InvalidInstanceIdError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => "InvalidInstanceIdError: $message";
}

class UnexpectedError extends Error {
  final String message;
  final String details;

  UnexpectedError(this.message, this.details);
  factory UnexpectedError.fromPlatformException(PlatformException err) =>
      UnexpectedError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => [
        "UnexpectedError: $message",
        "  cause: $details",
      ].join("\n");
}

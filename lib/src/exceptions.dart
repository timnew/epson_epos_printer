import 'package:flutter/services.dart';

class Epos2Exception implements Exception {
  final String code;
  final String methodName;

  Epos2Exception(this.code, this.methodName);
  factory Epos2Exception.fromPlatformException(PlatformException err) =>
      Epos2Exception(
        err.code,
        err.details as String,
      );

  @override
  String toString() => [
        "Epos2Exception: $code",
        "  from: $methodName",
      ].join("\n");
}

class BadMarshalError extends Error {
  final String message;
  final String methodName;

  BadMarshalError(this.message, this.methodName);
  factory BadMarshalError.fromPlatformException(PlatformException err) =>
      BadMarshalError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => [
        "BadMarshalError: $message",
        "  from: $methodName",
      ].join("\n");
}

class BadEnumError extends Error {
  final String message;
  final String methodName;

  BadEnumError(this.message, this.methodName);
  factory BadEnumError.fromPlatformException(PlatformException err) =>
      BadEnumError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => [
        "BadEnumError: $message",
        "  from: $methodName",
      ].join("\n");
}

class InvalidInstanceIdError extends Error {
  final String message;
  final String methodName;

  InvalidInstanceIdError(this.message, this.methodName);
  factory InvalidInstanceIdError.fromPlatformException(PlatformException err) =>
      InvalidInstanceIdError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => [
        "InvalidInstanceIdError: $message",
        "  from: $methodName",
      ].join("\n");
}

class UnexpectedError extends Error {
  final String message;
  final String methodName;

  UnexpectedError(this.message, this.methodName);
  factory UnexpectedError.fromPlatformException(PlatformException err) =>
      UnexpectedError(
        err.message!,
        err.details as String,
      );

  @override
  String toString() => [
        "UnexpectedError: $message",
        "  from: $methodName",
      ].join("\n");
}

import 'package:flutter/services.dart';

import '../assertions.dart';
import '../exception_helper.dart';
import 'enums.dart';

final printerChannel = const MethodChannel("epson_epos_printer/printer")
  // * Workaround for issue https://github.com/flutter/flutter/issues/10437
  ..invokeMethod("init");

Future<int> createNativePrinter(Epos2Series series, Epos2Model model) async {
  final id = await printerChannel.invokeMethod<int>("createPrinter", {
    "series": series.name,
    "model": model.name,
  }).handlePlatformException();

  return id.checkNotNull();
}

Future<void> destroyNativePrinter(int id) async {
  return printerChannel
      .invokeMethod("destroyPrinter", id)
      .handlePlatformException();
}

Future<T?> invokeChannel<T>({
  required int id,
  required String method,
  Map? arguments,
}) async =>
    printerChannel.invokeMethod<T>(method, {
      "id": id,
      "args": arguments,
    }).handlePlatformException();

Epos2StatusEvent decodeEpos2StatusEvent(dynamic value) =>
    Epos2StatusEvent.values.byName(value as String);

import 'package:flutter/services.dart';

import '../util.dart';
import 'enums.dart';

/// Contract
/// * Channel Name: epson_epos_printer/printer
/// * Channel Type: MethodChannel
/// * Codec: StandardCodec
///
/// * Method: int createPrinter({String series, String model})
/// * Method: void destroyPrinter(int id)
const printerChannel = MethodChannel("epson_epos_printer/printer");

Future<int> createNativePrinter(Epos2Series series, Epos2Model model) async {
  final id = await printerChannel.invokeMethod<int>("createPrinter", {
    "series": series.name,
    "model": model.name,
  }).translatePlatformException();

  return checkNotNull(id);
}

Future<void> destroyNativePrinter(int id) async {
  return printerChannel
      .invokeMethod("destroyPrinter", id)
      .translatePlatformException();
}

Future<T?> invokeChannel<T>(int id, String method, Map? args) async =>
    printerChannel.invokeMethod<T>(method, {
      "id": id,
      "args": args,
    }).translatePlatformException();

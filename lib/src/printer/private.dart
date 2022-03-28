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
///
/// * Method: void connect({id: String, args: {String target, Long timeout=15000}})
/// * Method: void disconnect({id: String})
///
/// * Method: void sendData({id: String, args: {Long timeout=10000}})
/// * Method: void clearCommandBuffer({id: String})
///
/// * Method: void addTextAlign({id: String, args: {String align}})
/// * Method: void addLineSpace({id: String, args: {Long space}})
/// * Method: void addTextRotate({id: String, args: {Bool rotate = false}})
/// * Method: void addText({id: String, args: {String data}})
/// * Method: void addTextLang({id: String, args: {String lang = "Default"}})
/// * Method: void addTextFont({id: String, args: {String font = "A"}})
/// * Method: void addTextSmooth({id: String, args: {bool smooth = false}})
/// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
/// * Method: void addTextStyle({id: String, args: {bool em = false, bool ul = false, bool reverse = false, int color = DEFAULT}})
/// * Method: void addHPosition({id: String, args: {Long position}})
///
/// * Method: void addFeedUnit({id: String, args: {Long unit}})
/// * Method: void addFeedLine({id: String, args: {Long line}})
///
/// * Method: void addCut({id: String, args: {String cutType}})
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

Future<T?> invokeChannel<T>({
  required int id,
  required String method,
  Map? arguments,
}) async =>
    printerChannel.invokeMethod<T>(method, {
      "id": id,
      "args": arguments,
    }).translatePlatformException();

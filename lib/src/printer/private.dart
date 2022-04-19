import 'package:flutter/services.dart';

import '../assertions.dart';
import '../exception_helper.dart';
import 'enums.dart';
import 'types.dart';

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
/// * Method: void addTextStyle({id: String, args: {bool bold = false, bool underline = false, bool reverse = false, int color = DEFAULT}})
/// * Method: void addHPosition({id: String, args: {Long position}})
///
/// * Method: void addFeedUnit({id: String, args: {Long unit}})
/// * Method: void addFeedLine({id: String, args: {Long line}})
///
/// * Method: void addCut({id: String, args: {String cutType}})
///
/// * Channel Name: epson_epos_printer/printer/$id/status
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream<Epos2CallbackCode> onListen()
/// * Method: void onCancel()
///
/// * Type Epos2CallbackCode
/// ```
/// enum Epos2CallbackCode {
///   SUCCESS,
///   ERR_TIMEOUT,
///   ERR_NOT_FOUND,
///   ERR_AUTORECOVER,
///   ERR_COVER_OPEN,
///   ERR_CUTTER,
///   ERR_MECHANICAL,
///   ERR_EMPTY,
///   ERR_UNRECOVERABLE,
///   ERR_SYSTEM,
///   ERR_PORT,
///   ERR_INVALID_WINDOW,
///   ERR_JOB_NOT_FOUND,
///   PRINTING,
///   ERR_SPOOLER,
///   ERR_BATTERY_LOW,
///   ERR_TOO_MANY_REQUESTS,
///   ERR_REQUEST_ENTITY_TOO_LARGE,
///   CANCELED,
///   ERR_NO_MICR_DATA,
///   ERR_ILLEGAL_LENGTH,
///   ERR_NO_MAGNETIC_DATA,
///   ERR_RECOGNITION,
///   ERR_READ,
///   ERR_NOISE_DETECTED,
///   ERR_PAPER_JAM,
///   ERR_PAPER_PULLED_OUT,
///   ERR_CANCEL_FAILED,
///   ERR_PAPER_TYPE,
///   ERR_WAIT_INSERTION,
///   ERR_ILLEGAL,
///   ERR_INSERTED,
///   ERR_WAIT_REMOVAL,
///   ERR_DEVICE_BUSY,
///   ERR_GET_JSON_SIZE,
///   ERR_IN_USE,
///   ERR_CONNECT,
///   ERR_DISCONNECT,
///   ERR_DIFFERENT_MODEL,
///   ERR_DIFFERENT_VERSION,
///   ERR_MEMORY,
///   ERR_PROCESSING,
///   ERR_DATA_CORRUPTED,
///   ERR_PARAM,
///   RETRY,
///   ERR_RECOVERY_FAILURE,
///   ERR_JSON_FORMAT,
///   ERR_FAILURE,
/// }
/// ```
///
/// * Channel Name: epson_epos_printer/printer/$id/event
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream<Epos2Device> onListen()
/// * Method: void onCancel()
///
/// * Type Epos2PrinterEvent
/// ```
/// {
///   "event": String,
///   "printerJobId": String?,
///   "connection": bool,
///   "online": bool?,
///   "coverOpen": bool?,
///   "paper": String?,
///   "paperFeed": bool?,
///   "panelSwitch": bool?,
///   "waitOnline": int, // TODO: Not documented, maybe remove this?!
///   "drawer": bool?,
///   "errorStatus": String?
///   "autoRecoverError": String?
///   "buzzer": bool?,
///   "adapter": bool?,
///   "batteryLevel": int?
///   "removalWaiting": String?
///   "unrecoverError": String?
/// }
/// ```
final printerChannel = const MethodChannel("epson_epos_printer/printer")
  // * Workaround for issue https://github.com/flutter/flutter/issues/10437
  ..invokeMethod("init");

Future<int> createNativePrinter(Epos2Series series, Epos2Model model) async {
  final id = await printerChannel.invokeMethod<int>("createPrinter", {
    "series": series.name,
    "model": model.name,
  }).handlePlatformException();

  return checkNotNull(id);
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

final _epos2CallbackCodeNameMap = Epos2CallbackCode.values.asNameMap();
Epos2CallbackCode decodeEpos2CallbackCode(dynamic event) =>
    _epos2CallbackCodeNameMap[event as String] ??
    throwBadEnumError(
      "Epos2CallbackCode",
      event,
      "Epos2Printer._decodeStatusEvent",
    );

Epos2PrinterEvent decodeEpos2PrinterEvent(dynamic event) =>
    Epos2PrinterEvent.fromJson(event as Map<String, dynamic>);

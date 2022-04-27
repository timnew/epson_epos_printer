import 'dart:async';

import 'package:flutter/services.dart';

import '../assertions.dart';
import 'enums.dart';
import 'private.dart';
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
/// * Method: Future<PrinterStatus> sendData({id: String, args: {Long timeout=10000}})

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
/// * Channel Name: epson_epos_printer/printer/\(id)/status
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream<String> onListen()
/// * Method: void onCancel()
/// * Epos2StatusEvent:
///   - ONLINE
///   - OFFLINE
///   - POWER_OFF
///   - COVER_CLOSE
///   - COVER_OPEN
///   - PAPER_OK
///   - PAPER_NEAR_END
///   - PAPER_EMPTY
///   - DRAWER_HIGH
///   - DRAWER_LOW
///   - BATTERY_ENOUGH
///   - BATTERY_EMPTY
///   - INSERTION_WAIT_SLIP
///   - INSERTION_WAIT_VALIDATION
///   - INSERTION_WAIT_MICR
///   - INSERTION_WAIT_NONE
///   - REMOVAL_WAIT_PAPER
///   - REMOVAL_WAIT_NONE
///   - SLIP_PAPER_OK
///   - SLIP_PAPER_EMPTY
///   - AUTO_RECOVER_ERROR
///   - AUTO_RECOVER_OK
///   - UNRECOVERABLE_ERROR
///
/// * Type PrinterStatus/Epos2PrinterStatusInfo
/// ```
/// {
///   "printerJobId": String?,
///   "connection": bool?,
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
class Epos2Printer {
  final int id;
  final Epos2Series series;
  final Epos2Model model;
  final String target;
  final EventChannel _statusChannel;

  Epos2Printer._(this.id, this.series, this.model, this.target)
      : _statusChannel = EventChannel("epson_epos_printer/printer/$id/status");

  static Future<Epos2Printer> create({
    required Epos2Series series,
    required Epos2Model model,
    required String target,
  }) async =>
      Epos2Printer._(
        await createNativePrinter(series, model),
        series,
        model,
        target,
      );

  static Future<Epos2Printer> createFromOptions(
    Epos2PrinterCreationOptions options,
  ) async =>
      create(
        series: options.series,
        model: options.model,
        target: options.target,
      );

  @override
  String toString() => "{Epos2Printer[$id] $series $model $target}";

  Future<void> dispose() async => destroyNativePrinter(id);

  Stream<Epos2StatusEvent> statusStream() =>
      _statusChannel.receiveBroadcastStream().map(decodeEpos2StatusEvent);

  // ==========================================================================

  /// * Method: void connect({id: String, args: {String target, Long timeout}})
  Future<void> connect({
    Duration timeout = const Duration(milliseconds: 15000),
  }) async =>
      invokeChannel(
        id: id,
        method: "connect",
        arguments: {"target": target, "timeout": timeout.inMilliseconds},
      );

  /// * Method: void disconnect({id: String})
  Future<void> disconnect() async => invokeChannel(
        id: id,
        method: "disconnect",
      );

  // ==========================================================================

  /// * Method: void sendData({id: String, args: {Long timeout=10000}})
  Future<Epos2PrinterStatusInfo> sendData({
    Duration timeout = const Duration(milliseconds: 10000),
  }) async =>
      invokeChannel<Map<String, dynamic>>(
        id: id,
        method: "sendData",
        arguments: {"timeout": timeout.inMilliseconds},
      ).then(
        (data) => Epos2PrinterStatusInfo.fromJson(
          data.checkNotNull(),
        ),
      );

  /// * Method: void clearCommandBuffer({id: String})
  Future<void> clearCommandBuffer() async => invokeChannel(
        id: id,
        method: "clearCommandBuffer",
      );

  // ==========================================================================

  /// * Method: void addTextAlign({id: String, args: {String align}})
  Future<void> addTextAlign(Epos2Alignment align) async => invokeChannel(
        id: id,
        method: "addTextAlign",
        arguments: {"align": align.name},
      );

  /// * Method: void addLineSpace({id: String, args: {Long space}})
  Future<void> addLineSpace(int space) async => invokeChannel(
        id: id,
        method: "addLineSpace",
        arguments: {
          "space": checkInRange(space, "space", 0, 255),
        },
      );

  /// * Method: void addTextRotate({id: String, args: {Bool rotate = false}})
  Future<void> addTextRotate(bool rotate) async => invokeChannel(
        id: id,
        method: "addTextRotate",
        arguments: {"rotate": rotate},
      );

  /// * Method: void addText({id: String, args: {String data}})
  Future<void> addText(String data) async => invokeChannel(
        id: id,
        method: "addText",
        arguments: {"data": data},
      );

  Future<void> addTextLn(String text) async => addText("$text\n");
  Future<void> addTextLines(Iterable<String> lines) async =>
      addText("${lines.join("\n")}\n");

  /// * Method: void addTextLang({id: String, args: {String lang = "Default"}})
  Future<void> addTextLanguage(Epos2Language language) async => invokeChannel(
        id: id,
        method: "addTextLang",
        arguments: {"lang": language.name},
      );

  /// * Method: void addTextFont({id: String, args: {String font = "A"}})
  Future<void> addTextFont(Epos2Font font) async => invokeChannel(
        id: id,
        method: "addTextFont",
        arguments: {"font": font.name},
      );

  /// * Method: void addTextSmooth({id: String, args: {Bool smooth = false}})
  Future<void> addTextSmooth(bool smooth) async => invokeChannel(
        id: id,
        method: "addTextFont",
        arguments: {"smooth": smooth},
      );

  /// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
  Future<void> addTextSize({int width = 1, int height = 1}) async =>
      invokeChannel(
        id: id,
        method: "addTextSize",
        arguments: {
          "width": checkInRange(width, "width", 1, 8),
          "height": checkInRange(height, "height", 1, 8),
        },
      );

  /// * Method: void addTextStyle({id: String, args: {bool em = false, bool ul = false, bool reverse = false, int color = DEFAULT}})
  Future<void> addTextStyle({
    bool bold = false,
    bool underline = false,
    bool reverse = false,
    Epos2Color color = Epos2Color.DEFAULT,
  }) async =>
      invokeChannel(
        id: id,
        method: "addTextStyle",
        arguments: {
          "em": bold,
          "ul": underline,
          "reverse": reverse,
          "color": color.name,
        },
      );

  /// * Method: void addHPosition({id: String, args: {Long position}})
  Future<void> addHPosition(int position) async => invokeChannel(
        id: id,
        method: "addHPosition",
        arguments: {
          "position": checkInRange(position, "position", 0, 65535),
        },
      );

  // ==========================================================================

  /// * Method: void addFeedUnit({id: String, args: {Long unit}})
  Future<void> addFeedUnit(int unit) async => invokeChannel(
        id: id,
        method: "addFeedUnit",
        arguments: {
          "unit": checkInRange(unit, "unit", 0, 255),
        },
      );

  /// * Method: void addFeedLine({id: String, args: {Long line}})
  Future<void> addFeedLine(int line) async => invokeChannel(
        id: id,
        method: "addFeedLine",
        arguments: {
          "line": checkInRange(line, "line", 0, 255),
        },
      );

  // ==========================================================================

  /// * Method: void addCut({id: String, args: {String cutType}})
  Future<void> addCut(Epos2Cut cut) async => invokeChannel(
        id: id,
        method: "addCut",
        arguments: {"cutType": cut.name},
      );
}

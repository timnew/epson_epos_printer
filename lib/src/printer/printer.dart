import 'dart:async';

import 'package:flutter/services.dart';

import '../exception_helper.dart';
import '../exceptions.dart';
import '../assertions.dart';
import 'enums.dart';
import 'private.dart';
import 'types.dart';

class Epos2Printer {
  final int id;
  final Epos2Series series;
  final Epos2Model model;
  final EventChannel _statusChannel;
  final EventChannel _eventChannel;
  late final StreamController _eventController;

  Epos2Printer._(this.id, this.series, this.model)
      : _statusChannel = EventChannel("epson_epos_printer/printer/$id/status"),
        _eventChannel = EventChannel("epson_epos_printer/printer/$id/event") {
    _eventController = StreamController.broadcast(
      onListen: _onEventListen,
      onCancel: _onEventCancel,
      sync: true,
    );
  }

  void _onStatusCancel() {}

  void _onEventCancel() {}

  void _onEventListen() {}

  static Future<Epos2Printer> create({
    required Epos2Series series,
    required Epos2Model model,
  }) async =>
      Epos2Printer._(
        await createNativePrinter(series, model),
        series,
        model,
      );

  Future<void> dispose() async => destroyNativePrinter(id);

  Stream<Epos2CallbackCode> statusStream() =>
      _statusChannel.receiveBroadcastStream().map(decodeEpos2CallbackCode);

  Stream<Epos2PrinterEvent> eventStream() =>
      _eventChannel.receiveBroadcastStream().map(decodeEpos2PrinterEvent);

  // ==========================================================================

  /// * Method: void connect({id: String, args: {String target, Long timeout}})
  Future<void> connect(
    String target, {
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
  Future<void> sendData({
    Duration timeout = const Duration(milliseconds: 10000),
  }) async =>
      invokeChannel(
        id: id,
        method: "sendData",
        arguments: {"timeout": timeout.inMilliseconds},
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

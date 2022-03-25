import 'package:epson_epos_printer/src/printer.dart';

import 'private.dart';

class Epos2Printer {
  final int id;
  final Epos2Series series;
  final Epos2Model model;

  Epos2Printer._(this.id, this.series, this.model);

  Future<Epos2Printer> create({
    required Epos2Series series,
    required Epos2Model model,
  }) async =>
      Epos2Printer._(
        await createNativePrinter(series, model),
        series,
        model,
      );

  Future<void> dispose() async => destroyNativePrinter(id);

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

  /// * Method: void addText({id: String, args: {String data}})
  Future<void> addText(String data) async => invokeChannel(
        id: id,
        method: "addText",
        arguments: {"data": data},
      );

  /// * Method: void addTextAlign({id: String, args: {String align}})
  Future<void> addTextAlign(Epos2Align align) async => invokeChannel(
        id: id,
        method: "addTextAlign",
        arguments: {"align": align.name},
      );

  /// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
  Future<void> addTextSize(int width, int height) async => invokeChannel(
        id: id,
        method: "addTextSize",
        arguments: {"width": width, "height": height},
      );

  /// * Method: void addLineSpace({id: String, args: {Long space}})
  Future<void> addLineSpace(int space) async => invokeChannel(
        id: id,
        method: "addLineSpace",
        arguments: {"space": space},
      );

  /// * Method: void addCut({id: String, args: {String cutType}})
  Future<void> addCut(Epos2Cut cut) async => invokeChannel(
        id: id,
        method: "addCut",
        arguments: {"cutType": cut.name},
      );
}

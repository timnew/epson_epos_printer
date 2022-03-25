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
}

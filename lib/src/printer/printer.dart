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
}

import 'package:epson_epos_printer/src/assertions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
class Epos2PrinterCreationOptions with _$Epos2PrinterCreationOptions {
  const Epos2PrinterCreationOptions._();

  const factory Epos2PrinterCreationOptions({
    required Epos2Series series,
    required Epos2Model model,
    required String target,
  }) = _Epos2PrinterCreationOptions;

  static final _connectionStringPattern = RegExp(
    r"^\{Epos2Printer series=(?<series>\w+),\s*model=(?<model>\w+),\s*target=(?<target>[\w:]+)\}$",
    caseSensitive: false,
  );

  factory Epos2PrinterCreationOptions.from(String connectionString) {
    final match = _connectionStringPattern.firstMatch(connectionString);
    if (match == null) {
      throw ArgumentError.value(
        connectionString,
        "connectionString",
        "Bad connection string",
      );
    }

    return Epos2PrinterCreationOptions(
      series: Epos2Series.values.byName(
        match.namedGroup("series").requireNotNull(),
      ),
      model: Epos2Model.values.byName(
        match.namedGroup("model").requireNotNull(),
      ),
      target: match.namedGroup("target").requireNotNull(),
    );
  }

  @override
  String toString() => toConnectionString();

  String toConnectionString() =>
      "{Epos2Printer series=${series.name}, model=${model.name}, target=$target}";
}

@freezed
class Epos2PrinterStatusInfo with _$Epos2PrinterStatusInfo {
  const factory Epos2PrinterStatusInfo({
    required String? printerJobId,
    required bool connection,
    required bool? online,
    required bool? coverOpen,
    required Epos2StatusPaper? paper,
    required bool? paperFeed,
    required bool? panelSwitch,
    required int waitOnline,
    required bool? drawer,
    required Epos2PrinterError? errorStatus,
    required Epos2AutoRecoverError? autoRecoverError,
    required bool? buzzer,
    required bool? adapter,
    required int? batteryLevel,
    required Epos2RemovalWaiting? removalWaiting,
    required Epos2UnrecoverError? unrecoverError,
  }) = _Epos2PrinterStatusInfo;

  factory Epos2PrinterStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$Epos2PrinterStatusInfoFromJson(json);
}

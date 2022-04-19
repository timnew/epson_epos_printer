import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
class Epos2PrinterEvent with _$Epos2PrinterEvent {
  const factory Epos2PrinterEvent({
    required Epos2StatusEvent event,
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
  }) = _Epos2PrinterEvent;

  factory Epos2PrinterEvent.fromJson(Map<String, dynamic> json) =>
      _$Epos2PrinterEventFromJson(json);
}

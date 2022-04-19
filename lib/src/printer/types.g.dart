// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Epos2PrinterEvent _$$_Epos2PrinterEventFromJson(Map<String, dynamic> json) =>
    _$_Epos2PrinterEvent(
      event: $enumDecode(_$Epos2StatusEventEnumMap, json['event']),
      printerJobId: json['printerJobId'] as String?,
      connection: json['connection'] as bool,
      online: json['online'] as bool?,
      coverOpen: json['coverOpen'] as bool?,
      paper: $enumDecodeNullable(_$Epos2StatusPaperEnumMap, json['paper']),
      paperFeed: json['paperFeed'] as bool?,
      panelSwitch: json['panelSwitch'] as bool?,
      waitOnline: json['waitOnline'] as int,
      drawer: json['drawer'] as bool?,
      errorStatus:
          $enumDecodeNullable(_$Epos2PrinterErrorEnumMap, json['errorStatus']),
      autoRecoverError: $enumDecodeNullable(
          _$Epos2AutoRecoverErrorEnumMap, json['autoRecoverError']),
      buzzer: json['buzzer'] as bool?,
      adapter: json['adapter'] as bool?,
      batteryLevel: json['batteryLevel'] as int?,
      removalWaiting: $enumDecodeNullable(
          _$Epos2RemovalWaitingEnumMap, json['removalWaiting']),
      unrecoverError: $enumDecodeNullable(
          _$Epos2UnrecoverErrorEnumMap, json['unrecoverError']),
    );

Map<String, dynamic> _$$_Epos2PrinterEventToJson(
        _$_Epos2PrinterEvent instance) =>
    <String, dynamic>{
      'event': _$Epos2StatusEventEnumMap[instance.event],
      'printerJobId': instance.printerJobId,
      'connection': instance.connection,
      'online': instance.online,
      'coverOpen': instance.coverOpen,
      'paper': _$Epos2StatusPaperEnumMap[instance.paper],
      'paperFeed': instance.paperFeed,
      'panelSwitch': instance.panelSwitch,
      'waitOnline': instance.waitOnline,
      'drawer': instance.drawer,
      'errorStatus': _$Epos2PrinterErrorEnumMap[instance.errorStatus],
      'autoRecoverError':
          _$Epos2AutoRecoverErrorEnumMap[instance.autoRecoverError],
      'buzzer': instance.buzzer,
      'adapter': instance.adapter,
      'batteryLevel': instance.batteryLevel,
      'removalWaiting': _$Epos2RemovalWaitingEnumMap[instance.removalWaiting],
      'unrecoverError': _$Epos2UnrecoverErrorEnumMap[instance.unrecoverError],
    };

const _$Epos2StatusEventEnumMap = {
  Epos2StatusEvent.ONLINE: 'ONLINE',
  Epos2StatusEvent.OFFLINE: 'OFFLINE',
  Epos2StatusEvent.POWER_OFF: 'POWER_OFF',
  Epos2StatusEvent.COVER_CLOSE: 'COVER_CLOSE',
  Epos2StatusEvent.COVER_OPEN: 'COVER_OPEN',
  Epos2StatusEvent.PAPER_OK: 'PAPER_OK',
  Epos2StatusEvent.PAPER_NEAR_END: 'PAPER_NEAR_END',
  Epos2StatusEvent.PAPER_EMPTY: 'PAPER_EMPTY',
  Epos2StatusEvent.DRAWER_HIGH: 'DRAWER_HIGH',
  Epos2StatusEvent.DRAWER_LOW: 'DRAWER_LOW',
  Epos2StatusEvent.BATTERY_ENOUGH: 'BATTERY_ENOUGH',
  Epos2StatusEvent.BATTERY_EMPTY: 'BATTERY_EMPTY',
  Epos2StatusEvent.INSERTION_WAIT_SLIP: 'INSERTION_WAIT_SLIP',
  Epos2StatusEvent.INSERTION_WAIT_VALIDATION: 'INSERTION_WAIT_VALIDATION',
  Epos2StatusEvent.INSERTION_WAIT_MICR: 'INSERTION_WAIT_MICR',
  Epos2StatusEvent.INSERTION_WAIT_NONE: 'INSERTION_WAIT_NONE',
  Epos2StatusEvent.REMOVAL_WAIT_PAPER: 'REMOVAL_WAIT_PAPER',
  Epos2StatusEvent.REMOVAL_WAIT_NONE: 'REMOVAL_WAIT_NONE',
  Epos2StatusEvent.SLIP_PAPER_OK: 'SLIP_PAPER_OK',
  Epos2StatusEvent.SLIP_PAPER_EMPTY: 'SLIP_PAPER_EMPTY',
  Epos2StatusEvent.AUTO_RECOVER_ERROR: 'AUTO_RECOVER_ERROR',
  Epos2StatusEvent.AUTO_RECOVER_OK: 'AUTO_RECOVER_OK',
  Epos2StatusEvent.UNRECOVERABLE_ERROR: 'UNRECOVERABLE_ERROR',
};

const _$Epos2StatusPaperEnumMap = {
  Epos2StatusPaper.OK: 'OK',
  Epos2StatusPaper.NEAR_END: 'NEAR_END',
  Epos2StatusPaper.EMPTY: 'EMPTY',
};

const _$Epos2PrinterErrorEnumMap = {
  Epos2PrinterError.NO_ERR: 'NO_ERR',
  Epos2PrinterError.MECHANICAL_ERR: 'MECHANICAL_ERR',
  Epos2PrinterError.AUTOCUTTER_ERR: 'AUTOCUTTER_ERR',
  Epos2PrinterError.UNRECOVER_ERR: 'UNRECOVER_ERR',
  Epos2PrinterError.AUTORECOVER_ERR: 'AUTORECOVER_ERR',
};

const _$Epos2AutoRecoverErrorEnumMap = {
  Epos2AutoRecoverError.HEAD_OVERHEAT: 'HEAD_OVERHEAT',
  Epos2AutoRecoverError.MOTOR_OVERHEAT: 'MOTOR_OVERHEAT',
  Epos2AutoRecoverError.BATTERY_OVERHEAT: 'BATTERY_OVERHEAT',
  Epos2AutoRecoverError.WRONG_PAPER: 'WRONG_PAPER',
  Epos2AutoRecoverError.COVER_OPEN: 'COVER_OPEN',
};

const _$Epos2RemovalWaitingEnumMap = {
  Epos2RemovalWaiting.NONE: 'NONE',
  Epos2RemovalWaiting.PAPER: 'PAPER',
};

const _$Epos2UnrecoverErrorEnumMap = {
  Epos2UnrecoverError.HIGH_VOLTAGE_ERR: 'HIGH_VOLTAGE_ERR',
  Epos2UnrecoverError.LOW_VOLTAGE_ERR: 'LOW_VOLTAGE_ERR',
};

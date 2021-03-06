// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Epos2PrinterStatusInfo _$$_Epos2PrinterStatusInfoFromJson(
        Map<String, dynamic> json) =>
    _$_Epos2PrinterStatusInfo(
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

Map<String, dynamic> _$$_Epos2PrinterStatusInfoToJson(
        _$_Epos2PrinterStatusInfo instance) =>
    <String, dynamic>{
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

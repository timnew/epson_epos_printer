// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Epos2PrinterEvent _$Epos2PrinterEventFromJson(Map<String, dynamic> json) {
  return _Epos2PrinterEvent.fromJson(json);
}

/// @nodoc
class _$Epos2PrinterEventTearOff {
  const _$Epos2PrinterEventTearOff();

  _Epos2PrinterEvent call(
      {required Epos2StatusEvent event,
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
      required Epos2UnrecoverError? unrecoverError}) {
    return _Epos2PrinterEvent(
      event: event,
      printerJobId: printerJobId,
      connection: connection,
      online: online,
      coverOpen: coverOpen,
      paper: paper,
      paperFeed: paperFeed,
      panelSwitch: panelSwitch,
      waitOnline: waitOnline,
      drawer: drawer,
      errorStatus: errorStatus,
      autoRecoverError: autoRecoverError,
      buzzer: buzzer,
      adapter: adapter,
      batteryLevel: batteryLevel,
      removalWaiting: removalWaiting,
      unrecoverError: unrecoverError,
    );
  }

  Epos2PrinterEvent fromJson(Map<String, Object?> json) {
    return Epos2PrinterEvent.fromJson(json);
  }
}

/// @nodoc
const $Epos2PrinterEvent = _$Epos2PrinterEventTearOff();

/// @nodoc
mixin _$Epos2PrinterEvent {
  Epos2StatusEvent get event => throw _privateConstructorUsedError;
  String? get printerJobId => throw _privateConstructorUsedError;
  bool get connection => throw _privateConstructorUsedError;
  bool? get online => throw _privateConstructorUsedError;
  bool? get coverOpen => throw _privateConstructorUsedError;
  Epos2StatusPaper? get paper => throw _privateConstructorUsedError;
  bool? get paperFeed => throw _privateConstructorUsedError;
  bool? get panelSwitch => throw _privateConstructorUsedError;
  int get waitOnline => throw _privateConstructorUsedError;
  bool? get drawer => throw _privateConstructorUsedError;
  Epos2PrinterError? get errorStatus => throw _privateConstructorUsedError;
  Epos2AutoRecoverError? get autoRecoverError =>
      throw _privateConstructorUsedError;
  bool? get buzzer => throw _privateConstructorUsedError;
  bool? get adapter => throw _privateConstructorUsedError;
  int? get batteryLevel => throw _privateConstructorUsedError;
  Epos2RemovalWaiting? get removalWaiting => throw _privateConstructorUsedError;
  Epos2UnrecoverError? get unrecoverError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Epos2PrinterEventCopyWith<Epos2PrinterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Epos2PrinterEventCopyWith<$Res> {
  factory $Epos2PrinterEventCopyWith(
          Epos2PrinterEvent value, $Res Function(Epos2PrinterEvent) then) =
      _$Epos2PrinterEventCopyWithImpl<$Res>;
  $Res call(
      {Epos2StatusEvent event,
      String? printerJobId,
      bool connection,
      bool? online,
      bool? coverOpen,
      Epos2StatusPaper? paper,
      bool? paperFeed,
      bool? panelSwitch,
      int waitOnline,
      bool? drawer,
      Epos2PrinterError? errorStatus,
      Epos2AutoRecoverError? autoRecoverError,
      bool? buzzer,
      bool? adapter,
      int? batteryLevel,
      Epos2RemovalWaiting? removalWaiting,
      Epos2UnrecoverError? unrecoverError});
}

/// @nodoc
class _$Epos2PrinterEventCopyWithImpl<$Res>
    implements $Epos2PrinterEventCopyWith<$Res> {
  _$Epos2PrinterEventCopyWithImpl(this._value, this._then);

  final Epos2PrinterEvent _value;
  // ignore: unused_field
  final $Res Function(Epos2PrinterEvent) _then;

  @override
  $Res call({
    Object? event = freezed,
    Object? printerJobId = freezed,
    Object? connection = freezed,
    Object? online = freezed,
    Object? coverOpen = freezed,
    Object? paper = freezed,
    Object? paperFeed = freezed,
    Object? panelSwitch = freezed,
    Object? waitOnline = freezed,
    Object? drawer = freezed,
    Object? errorStatus = freezed,
    Object? autoRecoverError = freezed,
    Object? buzzer = freezed,
    Object? adapter = freezed,
    Object? batteryLevel = freezed,
    Object? removalWaiting = freezed,
    Object? unrecoverError = freezed,
  }) {
    return _then(_value.copyWith(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Epos2StatusEvent,
      printerJobId: printerJobId == freezed
          ? _value.printerJobId
          : printerJobId // ignore: cast_nullable_to_non_nullable
              as String?,
      connection: connection == freezed
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as bool,
      online: online == freezed
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool?,
      coverOpen: coverOpen == freezed
          ? _value.coverOpen
          : coverOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      paper: paper == freezed
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as Epos2StatusPaper?,
      paperFeed: paperFeed == freezed
          ? _value.paperFeed
          : paperFeed // ignore: cast_nullable_to_non_nullable
              as bool?,
      panelSwitch: panelSwitch == freezed
          ? _value.panelSwitch
          : panelSwitch // ignore: cast_nullable_to_non_nullable
              as bool?,
      waitOnline: waitOnline == freezed
          ? _value.waitOnline
          : waitOnline // ignore: cast_nullable_to_non_nullable
              as int,
      drawer: drawer == freezed
          ? _value.drawer
          : drawer // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorStatus: errorStatus == freezed
          ? _value.errorStatus
          : errorStatus // ignore: cast_nullable_to_non_nullable
              as Epos2PrinterError?,
      autoRecoverError: autoRecoverError == freezed
          ? _value.autoRecoverError
          : autoRecoverError // ignore: cast_nullable_to_non_nullable
              as Epos2AutoRecoverError?,
      buzzer: buzzer == freezed
          ? _value.buzzer
          : buzzer // ignore: cast_nullable_to_non_nullable
              as bool?,
      adapter: adapter == freezed
          ? _value.adapter
          : adapter // ignore: cast_nullable_to_non_nullable
              as bool?,
      batteryLevel: batteryLevel == freezed
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      removalWaiting: removalWaiting == freezed
          ? _value.removalWaiting
          : removalWaiting // ignore: cast_nullable_to_non_nullable
              as Epos2RemovalWaiting?,
      unrecoverError: unrecoverError == freezed
          ? _value.unrecoverError
          : unrecoverError // ignore: cast_nullable_to_non_nullable
              as Epos2UnrecoverError?,
    ));
  }
}

/// @nodoc
abstract class _$Epos2PrinterEventCopyWith<$Res>
    implements $Epos2PrinterEventCopyWith<$Res> {
  factory _$Epos2PrinterEventCopyWith(
          _Epos2PrinterEvent value, $Res Function(_Epos2PrinterEvent) then) =
      __$Epos2PrinterEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {Epos2StatusEvent event,
      String? printerJobId,
      bool connection,
      bool? online,
      bool? coverOpen,
      Epos2StatusPaper? paper,
      bool? paperFeed,
      bool? panelSwitch,
      int waitOnline,
      bool? drawer,
      Epos2PrinterError? errorStatus,
      Epos2AutoRecoverError? autoRecoverError,
      bool? buzzer,
      bool? adapter,
      int? batteryLevel,
      Epos2RemovalWaiting? removalWaiting,
      Epos2UnrecoverError? unrecoverError});
}

/// @nodoc
class __$Epos2PrinterEventCopyWithImpl<$Res>
    extends _$Epos2PrinterEventCopyWithImpl<$Res>
    implements _$Epos2PrinterEventCopyWith<$Res> {
  __$Epos2PrinterEventCopyWithImpl(
      _Epos2PrinterEvent _value, $Res Function(_Epos2PrinterEvent) _then)
      : super(_value, (v) => _then(v as _Epos2PrinterEvent));

  @override
  _Epos2PrinterEvent get _value => super._value as _Epos2PrinterEvent;

  @override
  $Res call({
    Object? event = freezed,
    Object? printerJobId = freezed,
    Object? connection = freezed,
    Object? online = freezed,
    Object? coverOpen = freezed,
    Object? paper = freezed,
    Object? paperFeed = freezed,
    Object? panelSwitch = freezed,
    Object? waitOnline = freezed,
    Object? drawer = freezed,
    Object? errorStatus = freezed,
    Object? autoRecoverError = freezed,
    Object? buzzer = freezed,
    Object? adapter = freezed,
    Object? batteryLevel = freezed,
    Object? removalWaiting = freezed,
    Object? unrecoverError = freezed,
  }) {
    return _then(_Epos2PrinterEvent(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Epos2StatusEvent,
      printerJobId: printerJobId == freezed
          ? _value.printerJobId
          : printerJobId // ignore: cast_nullable_to_non_nullable
              as String?,
      connection: connection == freezed
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as bool,
      online: online == freezed
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool?,
      coverOpen: coverOpen == freezed
          ? _value.coverOpen
          : coverOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      paper: paper == freezed
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as Epos2StatusPaper?,
      paperFeed: paperFeed == freezed
          ? _value.paperFeed
          : paperFeed // ignore: cast_nullable_to_non_nullable
              as bool?,
      panelSwitch: panelSwitch == freezed
          ? _value.panelSwitch
          : panelSwitch // ignore: cast_nullable_to_non_nullable
              as bool?,
      waitOnline: waitOnline == freezed
          ? _value.waitOnline
          : waitOnline // ignore: cast_nullable_to_non_nullable
              as int,
      drawer: drawer == freezed
          ? _value.drawer
          : drawer // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorStatus: errorStatus == freezed
          ? _value.errorStatus
          : errorStatus // ignore: cast_nullable_to_non_nullable
              as Epos2PrinterError?,
      autoRecoverError: autoRecoverError == freezed
          ? _value.autoRecoverError
          : autoRecoverError // ignore: cast_nullable_to_non_nullable
              as Epos2AutoRecoverError?,
      buzzer: buzzer == freezed
          ? _value.buzzer
          : buzzer // ignore: cast_nullable_to_non_nullable
              as bool?,
      adapter: adapter == freezed
          ? _value.adapter
          : adapter // ignore: cast_nullable_to_non_nullable
              as bool?,
      batteryLevel: batteryLevel == freezed
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      removalWaiting: removalWaiting == freezed
          ? _value.removalWaiting
          : removalWaiting // ignore: cast_nullable_to_non_nullable
              as Epos2RemovalWaiting?,
      unrecoverError: unrecoverError == freezed
          ? _value.unrecoverError
          : unrecoverError // ignore: cast_nullable_to_non_nullable
              as Epos2UnrecoverError?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Epos2PrinterEvent implements _Epos2PrinterEvent {
  const _$_Epos2PrinterEvent(
      {required this.event,
      required this.printerJobId,
      required this.connection,
      required this.online,
      required this.coverOpen,
      required this.paper,
      required this.paperFeed,
      required this.panelSwitch,
      required this.waitOnline,
      required this.drawer,
      required this.errorStatus,
      required this.autoRecoverError,
      required this.buzzer,
      required this.adapter,
      required this.batteryLevel,
      required this.removalWaiting,
      required this.unrecoverError});

  factory _$_Epos2PrinterEvent.fromJson(Map<String, dynamic> json) =>
      _$$_Epos2PrinterEventFromJson(json);

  @override
  final Epos2StatusEvent event;
  @override
  final String? printerJobId;
  @override
  final bool connection;
  @override
  final bool? online;
  @override
  final bool? coverOpen;
  @override
  final Epos2StatusPaper? paper;
  @override
  final bool? paperFeed;
  @override
  final bool? panelSwitch;
  @override
  final int waitOnline;
  @override
  final bool? drawer;
  @override
  final Epos2PrinterError? errorStatus;
  @override
  final Epos2AutoRecoverError? autoRecoverError;
  @override
  final bool? buzzer;
  @override
  final bool? adapter;
  @override
  final int? batteryLevel;
  @override
  final Epos2RemovalWaiting? removalWaiting;
  @override
  final Epos2UnrecoverError? unrecoverError;

  @override
  String toString() {
    return 'Epos2PrinterEvent(event: $event, printerJobId: $printerJobId, connection: $connection, online: $online, coverOpen: $coverOpen, paper: $paper, paperFeed: $paperFeed, panelSwitch: $panelSwitch, waitOnline: $waitOnline, drawer: $drawer, errorStatus: $errorStatus, autoRecoverError: $autoRecoverError, buzzer: $buzzer, adapter: $adapter, batteryLevel: $batteryLevel, removalWaiting: $removalWaiting, unrecoverError: $unrecoverError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Epos2PrinterEvent &&
            const DeepCollectionEquality().equals(other.event, event) &&
            const DeepCollectionEquality()
                .equals(other.printerJobId, printerJobId) &&
            const DeepCollectionEquality()
                .equals(other.connection, connection) &&
            const DeepCollectionEquality().equals(other.online, online) &&
            const DeepCollectionEquality().equals(other.coverOpen, coverOpen) &&
            const DeepCollectionEquality().equals(other.paper, paper) &&
            const DeepCollectionEquality().equals(other.paperFeed, paperFeed) &&
            const DeepCollectionEquality()
                .equals(other.panelSwitch, panelSwitch) &&
            const DeepCollectionEquality()
                .equals(other.waitOnline, waitOnline) &&
            const DeepCollectionEquality().equals(other.drawer, drawer) &&
            const DeepCollectionEquality()
                .equals(other.errorStatus, errorStatus) &&
            const DeepCollectionEquality()
                .equals(other.autoRecoverError, autoRecoverError) &&
            const DeepCollectionEquality().equals(other.buzzer, buzzer) &&
            const DeepCollectionEquality().equals(other.adapter, adapter) &&
            const DeepCollectionEquality()
                .equals(other.batteryLevel, batteryLevel) &&
            const DeepCollectionEquality()
                .equals(other.removalWaiting, removalWaiting) &&
            const DeepCollectionEquality()
                .equals(other.unrecoverError, unrecoverError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(event),
      const DeepCollectionEquality().hash(printerJobId),
      const DeepCollectionEquality().hash(connection),
      const DeepCollectionEquality().hash(online),
      const DeepCollectionEquality().hash(coverOpen),
      const DeepCollectionEquality().hash(paper),
      const DeepCollectionEquality().hash(paperFeed),
      const DeepCollectionEquality().hash(panelSwitch),
      const DeepCollectionEquality().hash(waitOnline),
      const DeepCollectionEquality().hash(drawer),
      const DeepCollectionEquality().hash(errorStatus),
      const DeepCollectionEquality().hash(autoRecoverError),
      const DeepCollectionEquality().hash(buzzer),
      const DeepCollectionEquality().hash(adapter),
      const DeepCollectionEquality().hash(batteryLevel),
      const DeepCollectionEquality().hash(removalWaiting),
      const DeepCollectionEquality().hash(unrecoverError));

  @JsonKey(ignore: true)
  @override
  _$Epos2PrinterEventCopyWith<_Epos2PrinterEvent> get copyWith =>
      __$Epos2PrinterEventCopyWithImpl<_Epos2PrinterEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Epos2PrinterEventToJson(this);
  }
}

abstract class _Epos2PrinterEvent implements Epos2PrinterEvent {
  const factory _Epos2PrinterEvent(
      {required Epos2StatusEvent event,
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
      required Epos2UnrecoverError? unrecoverError}) = _$_Epos2PrinterEvent;

  factory _Epos2PrinterEvent.fromJson(Map<String, dynamic> json) =
      _$_Epos2PrinterEvent.fromJson;

  @override
  Epos2StatusEvent get event;
  @override
  String? get printerJobId;
  @override
  bool get connection;
  @override
  bool? get online;
  @override
  bool? get coverOpen;
  @override
  Epos2StatusPaper? get paper;
  @override
  bool? get paperFeed;
  @override
  bool? get panelSwitch;
  @override
  int get waitOnline;
  @override
  bool? get drawer;
  @override
  Epos2PrinterError? get errorStatus;
  @override
  Epos2AutoRecoverError? get autoRecoverError;
  @override
  bool? get buzzer;
  @override
  bool? get adapter;
  @override
  int? get batteryLevel;
  @override
  Epos2RemovalWaiting? get removalWaiting;
  @override
  Epos2UnrecoverError? get unrecoverError;
  @override
  @JsonKey(ignore: true)
  _$Epos2PrinterEventCopyWith<_Epos2PrinterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

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

/// @nodoc
class _$Epos2PrinterCreationOptionsTearOff {
  const _$Epos2PrinterCreationOptionsTearOff();

  _Epos2PrinterCreationOptions call(
      {required Epos2Series series,
      required Epos2Model model,
      required String target}) {
    return _Epos2PrinterCreationOptions(
      series: series,
      model: model,
      target: target,
    );
  }
}

/// @nodoc
const $Epos2PrinterCreationOptions = _$Epos2PrinterCreationOptionsTearOff();

/// @nodoc
mixin _$Epos2PrinterCreationOptions {
  Epos2Series get series => throw _privateConstructorUsedError;
  Epos2Model get model => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Epos2PrinterCreationOptionsCopyWith<Epos2PrinterCreationOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Epos2PrinterCreationOptionsCopyWith<$Res> {
  factory $Epos2PrinterCreationOptionsCopyWith(
          Epos2PrinterCreationOptions value,
          $Res Function(Epos2PrinterCreationOptions) then) =
      _$Epos2PrinterCreationOptionsCopyWithImpl<$Res>;
  $Res call({Epos2Series series, Epos2Model model, String target});
}

/// @nodoc
class _$Epos2PrinterCreationOptionsCopyWithImpl<$Res>
    implements $Epos2PrinterCreationOptionsCopyWith<$Res> {
  _$Epos2PrinterCreationOptionsCopyWithImpl(this._value, this._then);

  final Epos2PrinterCreationOptions _value;
  // ignore: unused_field
  final $Res Function(Epos2PrinterCreationOptions) _then;

  @override
  $Res call({
    Object? series = freezed,
    Object? model = freezed,
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      series: series == freezed
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Epos2Series,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as Epos2Model,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$Epos2PrinterCreationOptionsCopyWith<$Res>
    implements $Epos2PrinterCreationOptionsCopyWith<$Res> {
  factory _$Epos2PrinterCreationOptionsCopyWith(
          _Epos2PrinterCreationOptions value,
          $Res Function(_Epos2PrinterCreationOptions) then) =
      __$Epos2PrinterCreationOptionsCopyWithImpl<$Res>;
  @override
  $Res call({Epos2Series series, Epos2Model model, String target});
}

/// @nodoc
class __$Epos2PrinterCreationOptionsCopyWithImpl<$Res>
    extends _$Epos2PrinterCreationOptionsCopyWithImpl<$Res>
    implements _$Epos2PrinterCreationOptionsCopyWith<$Res> {
  __$Epos2PrinterCreationOptionsCopyWithImpl(
      _Epos2PrinterCreationOptions _value,
      $Res Function(_Epos2PrinterCreationOptions) _then)
      : super(_value, (v) => _then(v as _Epos2PrinterCreationOptions));

  @override
  _Epos2PrinterCreationOptions get _value =>
      super._value as _Epos2PrinterCreationOptions;

  @override
  $Res call({
    Object? series = freezed,
    Object? model = freezed,
    Object? target = freezed,
  }) {
    return _then(_Epos2PrinterCreationOptions(
      series: series == freezed
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Epos2Series,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as Epos2Model,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Epos2PrinterCreationOptions extends _Epos2PrinterCreationOptions {
  const _$_Epos2PrinterCreationOptions(
      {required this.series, required this.model, required this.target})
      : super._();

  @override
  final Epos2Series series;
  @override
  final Epos2Model model;
  @override
  final String target;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Epos2PrinterCreationOptions &&
            const DeepCollectionEquality().equals(other.series, series) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.target, target));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(series),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(target));

  @JsonKey(ignore: true)
  @override
  _$Epos2PrinterCreationOptionsCopyWith<_Epos2PrinterCreationOptions>
      get copyWith => __$Epos2PrinterCreationOptionsCopyWithImpl<
          _Epos2PrinterCreationOptions>(this, _$identity);
}

abstract class _Epos2PrinterCreationOptions
    extends Epos2PrinterCreationOptions {
  const factory _Epos2PrinterCreationOptions(
      {required Epos2Series series,
      required Epos2Model model,
      required String target}) = _$_Epos2PrinterCreationOptions;
  const _Epos2PrinterCreationOptions._() : super._();

  @override
  Epos2Series get series;
  @override
  Epos2Model get model;
  @override
  String get target;
  @override
  @JsonKey(ignore: true)
  _$Epos2PrinterCreationOptionsCopyWith<_Epos2PrinterCreationOptions>
      get copyWith => throw _privateConstructorUsedError;
}

Epos2PrinterStatusInfo _$Epos2PrinterStatusInfoFromJson(
    Map<String, dynamic> json) {
  return _Epos2PrinterStatusInfo.fromJson(json);
}

/// @nodoc
class _$Epos2PrinterStatusInfoTearOff {
  const _$Epos2PrinterStatusInfoTearOff();

  _Epos2PrinterStatusInfo call(
      {required String? printerJobId,
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
    return _Epos2PrinterStatusInfo(
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

  Epos2PrinterStatusInfo fromJson(Map<String, Object?> json) {
    return Epos2PrinterStatusInfo.fromJson(json);
  }
}

/// @nodoc
const $Epos2PrinterStatusInfo = _$Epos2PrinterStatusInfoTearOff();

/// @nodoc
mixin _$Epos2PrinterStatusInfo {
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
  $Epos2PrinterStatusInfoCopyWith<Epos2PrinterStatusInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Epos2PrinterStatusInfoCopyWith<$Res> {
  factory $Epos2PrinterStatusInfoCopyWith(Epos2PrinterStatusInfo value,
          $Res Function(Epos2PrinterStatusInfo) then) =
      _$Epos2PrinterStatusInfoCopyWithImpl<$Res>;
  $Res call(
      {String? printerJobId,
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
class _$Epos2PrinterStatusInfoCopyWithImpl<$Res>
    implements $Epos2PrinterStatusInfoCopyWith<$Res> {
  _$Epos2PrinterStatusInfoCopyWithImpl(this._value, this._then);

  final Epos2PrinterStatusInfo _value;
  // ignore: unused_field
  final $Res Function(Epos2PrinterStatusInfo) _then;

  @override
  $Res call({
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
abstract class _$Epos2PrinterStatusInfoCopyWith<$Res>
    implements $Epos2PrinterStatusInfoCopyWith<$Res> {
  factory _$Epos2PrinterStatusInfoCopyWith(_Epos2PrinterStatusInfo value,
          $Res Function(_Epos2PrinterStatusInfo) then) =
      __$Epos2PrinterStatusInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? printerJobId,
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
class __$Epos2PrinterStatusInfoCopyWithImpl<$Res>
    extends _$Epos2PrinterStatusInfoCopyWithImpl<$Res>
    implements _$Epos2PrinterStatusInfoCopyWith<$Res> {
  __$Epos2PrinterStatusInfoCopyWithImpl(_Epos2PrinterStatusInfo _value,
      $Res Function(_Epos2PrinterStatusInfo) _then)
      : super(_value, (v) => _then(v as _Epos2PrinterStatusInfo));

  @override
  _Epos2PrinterStatusInfo get _value => super._value as _Epos2PrinterStatusInfo;

  @override
  $Res call({
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
    return _then(_Epos2PrinterStatusInfo(
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
class _$_Epos2PrinterStatusInfo implements _Epos2PrinterStatusInfo {
  const _$_Epos2PrinterStatusInfo(
      {required this.printerJobId,
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

  factory _$_Epos2PrinterStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$$_Epos2PrinterStatusInfoFromJson(json);

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
    return 'Epos2PrinterStatusInfo(printerJobId: $printerJobId, connection: $connection, online: $online, coverOpen: $coverOpen, paper: $paper, paperFeed: $paperFeed, panelSwitch: $panelSwitch, waitOnline: $waitOnline, drawer: $drawer, errorStatus: $errorStatus, autoRecoverError: $autoRecoverError, buzzer: $buzzer, adapter: $adapter, batteryLevel: $batteryLevel, removalWaiting: $removalWaiting, unrecoverError: $unrecoverError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Epos2PrinterStatusInfo &&
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
  _$Epos2PrinterStatusInfoCopyWith<_Epos2PrinterStatusInfo> get copyWith =>
      __$Epos2PrinterStatusInfoCopyWithImpl<_Epos2PrinterStatusInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Epos2PrinterStatusInfoToJson(this);
  }
}

abstract class _Epos2PrinterStatusInfo implements Epos2PrinterStatusInfo {
  const factory _Epos2PrinterStatusInfo(
          {required String? printerJobId,
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
          required Epos2UnrecoverError? unrecoverError}) =
      _$_Epos2PrinterStatusInfo;

  factory _Epos2PrinterStatusInfo.fromJson(Map<String, dynamic> json) =
      _$_Epos2PrinterStatusInfo.fromJson;

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
  _$Epos2PrinterStatusInfoCopyWith<_Epos2PrinterStatusInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

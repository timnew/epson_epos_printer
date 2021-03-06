// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$Epos2DeviceTearOff {
  const _$Epos2DeviceTearOff();

  _Epos2Device call(
      {required String target,
      required String deviceName,
      required String ipAddress,
      required String macAddress,
      required String bdAddress}) {
    return _Epos2Device(
      target: target,
      deviceName: deviceName,
      ipAddress: ipAddress,
      macAddress: macAddress,
      bdAddress: bdAddress,
    );
  }
}

/// @nodoc
const $Epos2Device = _$Epos2DeviceTearOff();

/// @nodoc
mixin _$Epos2Device {
  String get target => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get bdAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Epos2DeviceCopyWith<Epos2Device> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Epos2DeviceCopyWith<$Res> {
  factory $Epos2DeviceCopyWith(
          Epos2Device value, $Res Function(Epos2Device) then) =
      _$Epos2DeviceCopyWithImpl<$Res>;
  $Res call(
      {String target,
      String deviceName,
      String ipAddress,
      String macAddress,
      String bdAddress});
}

/// @nodoc
class _$Epos2DeviceCopyWithImpl<$Res> implements $Epos2DeviceCopyWith<$Res> {
  _$Epos2DeviceCopyWithImpl(this._value, this._then);

  final Epos2Device _value;
  // ignore: unused_field
  final $Res Function(Epos2Device) _then;

  @override
  $Res call({
    Object? target = freezed,
    Object? deviceName = freezed,
    Object? ipAddress = freezed,
    Object? macAddress = freezed,
    Object? bdAddress = freezed,
  }) {
    return _then(_value.copyWith(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: macAddress == freezed
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      bdAddress: bdAddress == freezed
          ? _value.bdAddress
          : bdAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$Epos2DeviceCopyWith<$Res>
    implements $Epos2DeviceCopyWith<$Res> {
  factory _$Epos2DeviceCopyWith(
          _Epos2Device value, $Res Function(_Epos2Device) then) =
      __$Epos2DeviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String target,
      String deviceName,
      String ipAddress,
      String macAddress,
      String bdAddress});
}

/// @nodoc
class __$Epos2DeviceCopyWithImpl<$Res> extends _$Epos2DeviceCopyWithImpl<$Res>
    implements _$Epos2DeviceCopyWith<$Res> {
  __$Epos2DeviceCopyWithImpl(
      _Epos2Device _value, $Res Function(_Epos2Device) _then)
      : super(_value, (v) => _then(v as _Epos2Device));

  @override
  _Epos2Device get _value => super._value as _Epos2Device;

  @override
  $Res call({
    Object? target = freezed,
    Object? deviceName = freezed,
    Object? ipAddress = freezed,
    Object? macAddress = freezed,
    Object? bdAddress = freezed,
  }) {
    return _then(_Epos2Device(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: macAddress == freezed
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      bdAddress: bdAddress == freezed
          ? _value.bdAddress
          : bdAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Epos2Device extends _Epos2Device {
  const _$_Epos2Device(
      {required this.target,
      required this.deviceName,
      required this.ipAddress,
      required this.macAddress,
      required this.bdAddress})
      : super._();

  @override
  final String target;
  @override
  final String deviceName;
  @override
  final String ipAddress;
  @override
  final String macAddress;
  @override
  final String bdAddress;

  @override
  String toString() {
    return 'Epos2Device(target: $target, deviceName: $deviceName, ipAddress: $ipAddress, macAddress: $macAddress, bdAddress: $bdAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Epos2Device &&
            const DeepCollectionEquality().equals(other.target, target) &&
            const DeepCollectionEquality()
                .equals(other.deviceName, deviceName) &&
            const DeepCollectionEquality().equals(other.ipAddress, ipAddress) &&
            const DeepCollectionEquality()
                .equals(other.macAddress, macAddress) &&
            const DeepCollectionEquality().equals(other.bdAddress, bdAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(target),
      const DeepCollectionEquality().hash(deviceName),
      const DeepCollectionEquality().hash(ipAddress),
      const DeepCollectionEquality().hash(macAddress),
      const DeepCollectionEquality().hash(bdAddress));

  @JsonKey(ignore: true)
  @override
  _$Epos2DeviceCopyWith<_Epos2Device> get copyWith =>
      __$Epos2DeviceCopyWithImpl<_Epos2Device>(this, _$identity);
}

abstract class _Epos2Device extends Epos2Device {
  const factory _Epos2Device(
      {required String target,
      required String deviceName,
      required String ipAddress,
      required String macAddress,
      required String bdAddress}) = _$_Epos2Device;
  const _Epos2Device._() : super._();

  @override
  String get target;
  @override
  String get deviceName;
  @override
  String get ipAddress;
  @override
  String get macAddress;
  @override
  String get bdAddress;
  @override
  @JsonKey(ignore: true)
  _$Epos2DeviceCopyWith<_Epos2Device> get copyWith =>
      throw _privateConstructorUsedError;
}

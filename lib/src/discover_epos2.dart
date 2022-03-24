import 'dart:async';

import 'package:flutter/services.dart';

import 'models.dart';

/// Contract
/// * Channel Name: epson_epos_printer/discovery
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream onListen(Epos2FilterOption)
/// * Method: void onCancel()
///
/// * Type Epos2FilterOption
/// ```
/// {
///   "portType": Int,
///   "broadcast": String,
///   "deviceModel": Int,
///   "deviceType": Int,
/// }
/// ```
///
/// * Type Epos2Device
/// ```
/// {
///   "deviceType": Int,
///   "target": String,
///   "deviceName": String,
///   "ipAddress": String,
///   "macAddress": String,
///   "bdAddress": String
/// }
/// ```
const EventChannel _channel = EventChannel("epson_epos_printer/discovery");

Stream<Epos2Device> discoverEpos2Devices(Epos2FilterOption options) => _channel
    .receiveBroadcastStream(options.toJson())
    .map((json) => Epos2Device.fromJson(json as Map<String, dynamic>));

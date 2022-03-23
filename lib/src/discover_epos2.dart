import 'dart:async';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'models.dart';

final _logger = Logger("epos.discovery");

const MethodChannel _channel = MethodChannel(
  "epson_epos_printer/discovery",
  JSONMethodCodec(),
);

bool _initialized = false;

void _initialize() {
  if (_initialized) return;
  _logger.info("Initialise epos.discovery discovery channel");

  _channel.setMethodCallHandler(_onCallback);
}

StreamController<Epos2Device>? _discoveryStreamController;

Stream<Epos2Device> discoverEpos2Devices(Epos2FilterOption options) {
  if (_discoveryStreamController != null) {
    return Stream.error("Discovery in progress");
  }

  _initialize();

  final controller = StreamController<Epos2Device>(
    onCancel: stopEpos2Discovery,
  );
  _discoveryStreamController = controller;

  _channel
      .invokeMethod("start", options.toJson())
      .catchError((dynamic error) => controller.addError(error as Object));

  return controller.stream;
}

Future<void> stopEpos2Discovery() async {
  await _channel.invokeMethod("stop");
  _discoveryStreamController = null;
}

Future<void> _onCallback(MethodCall call) async {
  switch (call.method) {
    case "onDiscovery":
      return _onDiscovery(call.arguments as Map<String, dynamic>);
    default:
      throw UnsupportedError("Unknown method ${call.method}");
  }
}

Future<void> _onDiscovery(Map<String, dynamic> deviceJson) async {
  if (_discoveryStreamController?.isClosed ?? true) {
    _logger
        .warning("Discovery occurs when discovery stream is closed, ignored");
    return;
  }

  final device = Epos2Device.fromJson(deviceJson);

  _discoveryStreamController!.add(device);
}

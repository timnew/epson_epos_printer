
import 'dart:async';

import 'package:flutter/services.dart';

class EpsonEposPrinter {
  static const MethodChannel _channel = MethodChannel('epson_epos_printer');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

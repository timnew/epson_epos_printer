import 'package:freezed_annotation/freezed_annotation.dart';

import '../util.dart';

part 'models.freezed.dart';

@freezed
class Epos2Device with _$Epos2Device {
  const Epos2Device._();

  const factory Epos2Device({
    required String target,
    required String deviceName,
    required String ipAddress,
    required String macAddress,
    required String bdAddress,
  }) = _Epos2Device;

  factory Epos2Device.fromMarshal(Map data) {
    check(data["deviceType"] == 1, "Only EPOS2_TYPE_PRINTER is supported");

    return Epos2Device(
      target: data['target'] as String,
      deviceName: data['deviceName'] as String,
      ipAddress: data['ipAddress'] as String,
      macAddress: data['macAddress'] as String,
      bdAddress: data['bdAddress'] as String,
    );
  }
}

class Epos2FilterOption {
  const Epos2FilterOption();

  Map toMarshal() => {
        // Hard coded to EPOS2_PORTTYPE_TCP
        "portType": 1,
        // Hard coded to Broadcast to everyone in local network
        "broadcast": "255.255.255.255",
        // Hard coded to EPOS2_MODEL_ALL
        "deviceModel": 0,
        // Hard coded to EPOS2_TYPE_PRINTER
        "deviceType": 1,
      };
}

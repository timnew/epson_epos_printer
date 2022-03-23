import 'package:freezed_annotation/freezed_annotation.dart';

import 'util.dart';

part 'models.freezed.dart';

@freezed
class Epos2Device with _$Epos2Device {
  const Epos2Device._();

  const factory Epos2Device({
    required String? target,
    required String? ipAddress,
    required String? macAddress,
    required String? bdAddress,
  }) = _Epos2Device;

  factory Epos2Device.fromJson(JsonObject json) {
    check(json["deviceType"] == 1, "Only EPOS2_TYPE_PRINTER is supported");

    return Epos2Device(
      target: json['target'] as String?,
      ipAddress: json['ipAddress'] as String?,
      macAddress: json['macAddress'] as String?,
      bdAddress: json['bdAddress'] as String?,
    );
  }
}

class Epos2FilterOption {
  const Epos2FilterOption._();

  JsonObject toJson() => {
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

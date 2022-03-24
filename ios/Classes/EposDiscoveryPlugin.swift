import Flutter
import UIKit

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
public class EposDiscoveryPlugin: NSObject, FlutterStreamHandler {


    public static func register(with registrar: FlutterPluginRegistrar) {
        let streamChannel = FlutterEventChannel(name: "epson_epos_printer/discovery",                                                     binaryMessenger: registrar.messenger())

        let instance = EposDiscoveryPlugin()

        streamChannel.setStreamHandler(instance)
    }

    /// * Type Epos2FilterOption
    /// ```
    /// {
    ///   "portType": Int,
    ///   "broadcast": String,
    ///   "deviceModel": Int,
    ///   "deviceType": Int,
    /// }
    /// ```
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        guard let argMap = arguments as? Dictionary<String, Any>,
              let portType = argMap["portType"] as? Int32,
              let broadcast = argMap["broadcast"] as? String,
              let deviceModel = argMap["deviceModel"] as? Int32,
              let deviceType = argMap["deviceType"] as? Int32 else {
                return FlutterError(code: "invalid-argument",
                                    message: "arguments type is wrong",
                                    details: nil)
        }

        let filterOption = Epos2FilterOption()

        filterOption.portType = portType
        filterOption.broadcast = broadcast
        filterOption.deviceModel = deviceModel
        filterOption.deviceType = deviceType

        let resultCode = Epos2Discovery.start(filterOption, delegate: DiscoveryDelegate(events))
        return checkResultCode(resultCode)
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        let resultCode = Epos2Discovery.stop()

        return checkResultCode(resultCode)
    }
}

class DiscoveryDelegate : NSObject, Epos2DiscoveryDelegate{
    let eventSink: FlutterEventSink

    init(eventSink: @escaping FlutterEventSink) {
        self.eventSink = eventSink
    }

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
    public func onDiscovery(_ deviceInfo: Epos2DeviceInfo!) {
        let json: Dictionary<String, Any?> = [
            "deviceType": deviceInfo.deviceType,
            "target": deviceInfo.target,
            "deviceName": deviceInfo.deviceName,
            "ipAddress": deviceInfo.ipAddress,
            "macAddress": deviceInfo.macAddress,
            "bdAddress": deviceInfo.bdAddress
        ]
        eventSink(json)
    }
}

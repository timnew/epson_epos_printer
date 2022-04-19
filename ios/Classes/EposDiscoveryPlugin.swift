import Foundation
import Flutter

/// Contract
/// * Channel Name: epson_epos_printer/discovery
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream<Epos2Device> onListen(Epos2FilterOption)
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
    @objc
    public static func register(with registrar: FlutterPluginRegistrar) {
        let streamChannel = FlutterEventChannel(name: "epson_epos_printer/discovery",
                                                binaryMessenger: registrar.messenger())

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
        guard let args = arguments as? Dictionary<String, Any>,
              let portType = args["portType"] as? Int32,
              let broadcast = args["broadcast"] as? String,
              let deviceModel = args["deviceModel"] as? Int32,
              let deviceType = args["deviceType"] as? Int32 else {
            return flutterError(fromError: LibraryError.badMarshal, method: "EposDiscoveryPlugin.onListen")
        }

        let filterOption = Epos2FilterOption()

        filterOption.portType = portType
        filterOption.broadcast = broadcast
        filterOption.deviceModel = deviceModel
        filterOption.deviceType = deviceType

        let delegate = DiscoveryDelegate(eventSink: events)
        let resultCode = Epos2Discovery.start(filterOption, delegate: delegate)
        return flutterError(fromCode: resultCode)
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        let resultCode = Epos2Discovery.stop()

        return flutterError(fromCode: resultCode)
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

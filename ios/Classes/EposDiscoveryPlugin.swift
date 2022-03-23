import Flutter
import UIKit

public class EposDiscoveryPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "epson_epos_printer/discovery",
                                           binaryMessenger: registrar.messenger(),
                                           codec: FlutterJSONMethodCodec())
        let instance = EposDiscoveryPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}

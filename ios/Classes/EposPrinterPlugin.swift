import Foundation
import Flutter
 
/// Contract
/// * Channel Name: epson_epos_printer/printer
/// * Channel Type: MethodChannel
/// * Codec: StandardCodec
///
/// * Method: int createPrinter({String series, String model})
/// * Method: void destroyPrinter(int id)
///
/// * Method: void connect({String target, Long timeout})
/// * Method: void disconnect()

public class EposPrinterPlugin : NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "epson_epos_printer/printer", binaryMessenger: registrar.messenger())
        let instance = EposPrinterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method){
        case "createPrinter":
            wrap(handler: createPrinter, with: call.arguments, to: result)
        case "destroyPrinter":
            wrap(handler: destroyPrinter, with: call.arguments, to: result)
        case "connect":
            wrap(handler: connect, with: call.arguments, to: result)
        case "disconnect":
            wrap(handler: disconnect, with: call.arguments, to: result)
        default:            
            result(FlutterMethodNotImplemented)
        }
    }
    
    /// * Method: int createPrinter({String series, String model})
    func createPrinter(_ arguments: Any?) throws -> Any {
        guard let argMap = arguments as? Dictionary<String, Any>,
              let seriesName = argMap["series"] as? String,
              let modelName = argMap["model"] as? String else {
            throw LibraryError.badMarshal
        }
        
        let series = try epos2Series(byName: seriesName)
        let model = try epos2Model(byName: modelName)
        let printer = Epos2Printer.init(printerSeries: series, lang: model)!
        
        return InstanceManager.register(printer: printer)
    }
    
   
    /// * Method: void destroyPrinter(int id)
    func destroyPrinter(_ arguments: Any?) throws {
        guard let printerId = arguments as? Int32 else {
            throw LibraryError.badMarshal
        }
        
        InstanceManager.release(id: printerId)
    }
    
    /// * Method: void connect({id: String, args: {String target, Long timeout}})
    func connect(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let target = args["target"] as? String,
              let timeout = args["timeout"] as? Int64 else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.connect(target, timeout: Int(timeout))
        
        try check(resultCode: code)
    }

    /// * Method: void disconnect({id: String})
    func disconnect(_ arguments: Any?) throws {
        let (printer, _) = try instArgsDict(from: arguments)
        
        let code = printer.disconnect()
        
        try check(resultCode: code)
    }
}

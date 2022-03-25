import Foundation
import Flutter
 
/// Contract
/// * Channel Name: epson_epos_printer/printer
/// * Channel Type: MethodChannel
/// * Codec: StandardCodec
///
/// * Method: int createPrinter({String series, String model})
/// * Method: void destroyPrinter(int id)

public class EposPrinterPlugin : NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "epson_epos_printer/printer", binaryMessenger: registrar.messenger())
        let instance = EposPrinterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private static var printers: Dictionary<Int32, Epos2Printer> = [:];
    private static var nextId: Int32 = 0;
    private static func register(printer: Epos2Printer) -> Int32 {
        let id = nextId
        nextId += 1
        printers[id] = printer
        return id
    }
    private static func unregister(id: Int32) {
        printers.removeValue(forKey: id)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method){
        case "createPrinter":
            wrap(handler: createPrinter, with: call.arguments, to: result)
        case "destroyPrinter":
            wrap(handler: destroyPrinter, with: call.arguments, to: result)
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
        
        return EposPrinterPlugin.register(printer: printer)
    }
    
   
    /// * Method: void destroyPrinter(int id)
    func destroyPrinter(_ arguments: Any?) throws {
        guard let printerId = arguments as? Int32 else {
            throw LibraryError.badMarshal
        }
        
        EposPrinterPlugin.unregister(id: printerId)
    }
}

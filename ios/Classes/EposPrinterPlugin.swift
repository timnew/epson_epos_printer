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
/// * Method: void connect({id: String, args: {String target, Long timeout=15000}})
/// * Method: void disconnect({id: String})
///
/// * Method: void sendData({id: String, args: {Long timeout=10000}})
/// * Method: void clearCommandBuffer({id: String})
///
/// * Method: void addText({id: String, args: {String data}})
/// * Method: void addTextAlign({id: String, args: {String align}})
/// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
/// * Method: void addLineSpace({id: String, args: {Long space}})
/// * Method: void addCut({id: String, args: {String cutType}})

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
        
        case "sendData":
            wrap(handler: sendData, with: call.arguments, to: result)
        case "clearCommandBuffer":
            wrap(handler: clearCommandBuffer, with: call.arguments, to: result)
        
        case "connect":
            wrap(handler: connect, with: call.arguments, to: result)
        case "disconnect":
            wrap(handler: disconnect, with: call.arguments, to: result)
        
        case "addText":
            wrap(handler: addText, with: call.arguments, to: result)
        case "addTextAlign":
            wrap(handler: addTextAlign, with: call.arguments, to: result)
        case "addTextSize":
            wrap(handler: addTextSize, with: call.arguments, to: result)
        case "addLineSpace":
            wrap(handler: addLineSpace, with: call.arguments, to: result)
        case "addCut":
            wrap(handler: addCut, with: call.arguments, to: result)    
            
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
        let printer = try instIdOnly(from: arguments)
        
        let code = printer.disconnect()
        
        try check(resultCode: code)
    }
    
    /// * Method: void sendData({id: String, args: {Long timeout=10000}})
    func sendData(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let timeout = args["data"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.sendData(timeout)
        
        try check(resultCode: code)
    }
    
    /// * Method: void clearCommandBuffer({id: String})
    func clearCommandBuffer(_ arguments: Any?) throws {
        let printer = try instIdOnly(from: arguments)
        
        let code = printer.clearCommandBuffer()
        
        try check(resultCode: code)
    }

    
    /// * Method: void addText({id: String, args: {String data}})
    func addText(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let data = args["data"] as? String else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addText(data)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addTextAlign({id: String, args: {String align}})
    func addTextAlign(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let alignName = args["align"] as? String else {
            throw LibraryError.badMarshal
        }
        let align = try epos2Align(byName: alignName)
        
        let code = printer.addTextAlign(align)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
    func addTextSize(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let width = args["width"] as? Int,
              let height = args["height"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addTextSize(width, height: height)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addLineSpace({id: String, args: {Long space}})
    func addLineSpace(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let space = args["space"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addLineSpace(space)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addCut({id: String, args: {String cutType}})
    func addCut(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let cutTypeName = args["cutType"] as? String else {
            throw LibraryError.badMarshal
        }
        let cutType = try epos2Cut(byName: cutTypeName)
        
        let code = printer.addCut(cutType)
        
        try check(resultCode: code)
    }

}

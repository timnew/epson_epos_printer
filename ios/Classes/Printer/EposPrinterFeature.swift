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
/// * Method: Future<PrinterStatus> sendData({id: String, args: {Long timeout=10000}})

/// * Method: void clearCommandBuffer({id: String})
///
/// * Method: void addTextAlign({id: String, args: {String align}})
/// * Method: void addLineSpace({id: String, args: {Long space}})
/// * Method: void addTextRotate({id: String, args: {Bool rotate = false}})
/// * Method: void addText({id: String, args: {String data}})
/// * Method: void addTextLang({id: String, args: {String lang = "Default"}})
/// * Method: void addTextFont({id: String, args: {String font = "A"}})
/// * Method: void addTextSmooth({id: String, args: {bool smooth = false}})
/// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
/// * Method: void addTextStyle({id: String, args: {bool bold = false, bool underline = false, bool reverse = false, int color = DEFAULT}})
/// * Method: void addHPosition({id: String, args: {Long position}})
///
/// * Method: void addFeedUnit({id: String, args: {Long unit}})
/// * Method: void addFeedLine({id: String, args: {Long line}})
///
/// * Method: void addCut({id: String, args: {String cutType}})
///
/// * Channel Name: epson_epos_printer/printer/\(id)/status
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream<String> onListen()
/// * Method: void onCancel()
/// * Epos2StatusEvent:
///   - ONLINE
///   - OFFLINE
///   - POWER_OFF
///   - COVER_CLOSE
///   - COVER_OPEN
///   - PAPER_OK
///   - PAPER_NEAR_END
///   - PAPER_EMPTY
///   - DRAWER_HIGH
///   - DRAWER_LOW
///   - BATTERY_ENOUGH
///   - BATTERY_EMPTY
///   - INSERTION_WAIT_SLIP
///   - INSERTION_WAIT_VALIDATION
///   - INSERTION_WAIT_MICR
///   - INSERTION_WAIT_NONE
///   - REMOVAL_WAIT_PAPER
///   - REMOVAL_WAIT_NONE
///   - SLIP_PAPER_OK
///   - SLIP_PAPER_EMPTY
///   - AUTO_RECOVER_ERROR
///   - AUTO_RECOVER_OK
///   - UNRECOVERABLE_ERROR
///
/// * Type PrinterStatus/Epos2PrinterStatusInfo
/// ```
/// {
///   "printerJobId": String?,
///   "connection": bool?,
///   "online": bool?,
///   "coverOpen": bool?,
///   "paper": String?,
///   "paperFeed": bool?,
///   "panelSwitch": bool?,
///   "waitOnline": int, // TODO: Not documented, maybe remove this?!
///   "drawer": bool?,
///   "errorStatus": String?
///   "autoRecoverError": String?
///   "buzzer": bool?,
///   "adapter": bool?,
///   "batteryLevel": int?
///   "removalWaiting": String?
///   "unrecoverError": String?
/// }
/// ```


public class EposPrinterFeature : NSObject, FlutterPlugin {
    @objc
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "epson_epos_printer/printer", binaryMessenger: registrar.messenger())
        let instance = EposPrinterFeature(channel: channel, messenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    let channel: FlutterMethodChannel
    let messenger: FlutterBinaryMessenger
    init(channel: FlutterMethodChannel, messenger: FlutterBinaryMessenger) {
        self.channel = channel
        self.messenger = messenger
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method){
        case "init":
            for printer in InstanceManager.allPrinters() {
                safeDispose(printer: printer)
            }
            InstanceManager.reset()
            result(nil)            
        case "createPrinter":
            runHandler(createPrinter, for: call, returnTo: result)
        case "destroyPrinter":
            runHandler(destroyPrinter, for: call, returnTo: result)
            
        case "sendData":
            runAsyncHandler(sendData, for: call, returnTo: result)
            
        case "clearCommandBuffer":
            runHandler(clearCommandBuffer, for: call, returnTo: result)
            
        case "connect":
            runHandler(connect, for: call, returnTo: result)
        case "disconnect":
            runHandler(disconnect, for: call, returnTo: result)
            
        case "addTextAlign":
            runHandler(addTextAlign, for: call, returnTo: result)
        case "addLineSpace":
            runHandler(addLineSpace, for: call, returnTo: result)
        case "addTextRotate":
            runHandler(addTextRotate, for: call, returnTo: result)
        case "addText":
            runHandler(addText, for: call, returnTo: result)
        case "addTextLang":
            runHandler(addTextLang, for: call, returnTo: result)
        case "addTextFont":
            runHandler(addTextFont, for: call, returnTo: result)
        case "addTextSmooth":
            runHandler(addTextSmooth, for: call, returnTo: result)
        case "addTextSize":
            runHandler(addTextSize, for: call, returnTo: result)
        case "addTextStyle":
            runHandler(addTextStyle, for: call, returnTo: result)
        case "addHPosition":
            runHandler(addHPosition, for: call, returnTo: result)
            
        case "addFeedUnit":
            runHandler(addFeedUnit, for: call, returnTo: result)
        case "addFeedLine":
            runHandler(addFeedLine, for: call, returnTo: result)
            
        case "addCut":
            runHandler(addCut, for: call, returnTo: result)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    /// * Method: int createPrinter({String series, String model})
    func createPrinter(_ arguments: Any?) throws -> Int32 {
        guard let argMap = arguments as? Dictionary<String, Any>,
              let seriesName = argMap["series"] as? String,
              let modelName = argMap["model"] as? String else {
            throw LibraryError.badMarshal
        }
        
        let series = try encodeEpos2PrinterSeries(seriesName)
        let model = try encodeEpos2ModelLang(modelName)
        let printer = Epos2Printer.init(printerSeries: series, lang: model)!
        
        let id = InstanceManager.register(printer: printer);
        
        let statusDelegate = PrinterStatusDelegate(id: id, messenger: messenger, attachTo: printer)
        printer.setStatusChangeEventDelegate(statusDelegate)
      
        return id;
    }
    
    
    /// * Method: void destroyPrinter(int id)
    func destroyPrinter(_ arguments: Any?) throws {
        guard let printerId = arguments as? Int32 else {
            throw LibraryError.badMarshal
        }
        
        guard let printer = InstanceManager.release(id: printerId) else { return }
        
        safeDispose(printer: printer)       
    }
    
    // ==========================================================================
    
    /// * Method: void connect({id: String, args: {String target, Long timeout}})
    func connect(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let target = args["target"] as? String,
              let timeout = args["timeout"] as? Int64 else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.connect(target, timeout: Int(timeout))
        
        try check(returnCode: code)
    }
    
    /// * Method: void disconnect({id: String})
    func disconnect(_ arguments: Any?) throws {
        let printer = try instIdOnly(from: arguments)
        
        let code = printer.disconnect()
        
        try check(returnCode: code)
    }
    
    // ==========================================================================
    
    /// * Method: void sendData({id: String, args: {Long timeout=10000}})
    func sendData(_ arguments: Any?, callback: @escaping FlutterAsyncCallback) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let timeout = args["timeout"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        _ = PrinterAsyncDelegate(callback, attachTo: printer )
        
        let code = printer.sendData(timeout)
        
        try check(returnCode: code)
    }
    
    /// * Method: void clearCommandBuffer({id: String})
    func clearCommandBuffer(_ arguments: Any?) throws {
        let printer = try instIdOnly(from: arguments)
        
        let code = printer.clearCommandBuffer()
        
        try check(returnCode: code)
    }
    
    // ==========================================================================
    
    /// * Method: void addTextAlign({id: String, args: {String align}})
    func addTextAlign(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let alignName = args["align"] as? String else {
            throw LibraryError.badMarshal
        }
        let align = try encodeEpos2Align(alignName)
        
        let code = printer.addTextAlign(align)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addLineSpace({id: String, args: {Long space}})
    func addLineSpace(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let space = args["space"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addLineSpace(space)
        
        try check(returnCode: code)
    }
    
    /// * Method: addTextRotate({id String, args: {Bool rotate = false}})
    func addTextRotate(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let rotate = args["rotate"] as? Bool else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addTextRotate(encodeEpos2Bool(rotate))
        
        try check(returnCode: code)
    }
    
    
    /// * Method: void addText({id: String, args: {String data}})
    func addText(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let data = args["data"] as? String else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addText(data)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addTextLang({id: String, args: {String lang = "Default"}})
    func addTextLang(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let langName = args["lang"] as? String else {
            throw LibraryError.badMarshal
        }
        let lang = try encodeEpos2Lang(langName)
        
        let code = printer.addTextLang(lang)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addTextFont({id: String, args: {String font = "A"}})
    func addTextFont(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let fontName = args["font"] as? String else {
            throw LibraryError.badMarshal
        }
        let font = try encodeEpos2Font(fontName)
        
        let code = printer.addTextFont(font)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addTextSmooth({id: String, args: {bool smooth = false}})
    func addTextSmooth(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let smooth = args["smooth"] as? Bool else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addTextSmooth(encodeEpos2Bool(smooth))
        
        try check(returnCode: code)
    }
    
    /// * Method: void addTextSize({id: String, args: {width: Long, height: Long}})
    func addTextSize(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let width = args["width"] as? Int,
              let height = args["height"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addTextSize(width, height: height)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addTextStyle({id: String, args: {bool em = false, bool ul = false, bool reverse = false, int color = DEFAULT}})
    func addTextStyle(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let em = args["em"] as? Bool,
              let ul = args["ul"] as? Bool,
              let reverse = args["reverse"] as? Bool,
              let colorName = args["color"] as? String else {
            throw LibraryError.badMarshal
        }
        
        let color = try encodeEpos2Color(colorName)
        
        let code = printer.addTextStyle(encodeEpos2Bool(reverse),
                                        ul: encodeEpos2Bool(ul),
                                        em: encodeEpos2Bool(em),
                                        color: color)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addHPosition({id: String, args: {Long position}})
    func addHPosition(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let position = args["position"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addHPosition(position)
        
        try check(returnCode: code)
    }
    
    // ==========================================================================
    
    /// * Method: void addFeedUnit({id: String, args: {Long unit}})
    func addFeedUnit(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let unit = args["unit"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addFeedUnit(unit)
        
        try check(returnCode: code)
    }
    
    /// * Method: void addFeedLine({id: String, args: {Long line}})
    func addFeedLine(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let line = args["line"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addFeedLine(line)
        
        try check(returnCode: code)
    }
    // ==========================================================================
    
    /// * Method: void addCut({id: String, args: {String cutType}})
    func addCut(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let cutTypeName = args["cutType"] as? String else {
            throw LibraryError.badMarshal
        }
        let cutType = try encodeEpos2Cut(cutTypeName)
        
        let code = printer.addCut(cutType)
        
        try check(returnCode: code)
    }
    
}

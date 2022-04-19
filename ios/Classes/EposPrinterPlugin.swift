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
/// * Method: Stream<Epos2CallbackCode> onListen()
/// * Method: void onCancel()
///
/// * Type Epos2CallbackCode
/// ```
/// enum Epos2CallbackCode {
///   SUCCESS,
///   ERR_TIMEOUT,
///   ERR_NOT_FOUND,
///   ERR_AUTORECOVER,
///   ERR_COVER_OPEN,
///   ERR_CUTTER,
///   ERR_MECHANICAL,
///   ERR_EMPTY,
///   ERR_UNRECOVERABLE,
///   ERR_SYSTEM,
///   ERR_PORT,
///   ERR_INVALID_WINDOW,
///   ERR_JOB_NOT_FOUND,
///   PRINTING,
///   ERR_SPOOLER,
///   ERR_BATTERY_LOW,
///   ERR_TOO_MANY_REQUESTS,
///   ERR_REQUEST_ENTITY_TOO_LARGE,
///   CANCELED,
///   ERR_NO_MICR_DATA,
///   ERR_ILLEGAL_LENGTH,
///   ERR_NO_MAGNETIC_DATA,
///   ERR_RECOGNITION,
///   ERR_READ,
///   ERR_NOISE_DETECTED,
///   ERR_PAPER_JAM,
///   ERR_PAPER_PULLED_OUT,
///   ERR_CANCEL_FAILED,
///   ERR_PAPER_TYPE,
///   ERR_WAIT_INSERTION,
///   ERR_ILLEGAL,
///   ERR_INSERTED,
///   ERR_WAIT_REMOVAL,
///   ERR_DEVICE_BUSY,
///   ERR_GET_JSON_SIZE,
///   ERR_IN_USE,
///   ERR_CONNECT,
///   ERR_DISCONNECT,
///   ERR_DIFFERENT_MODEL,
///   ERR_DIFFERENT_VERSION,
///   ERR_MEMORY,
///   ERR_PROCESSING,
///   ERR_DATA_CORRUPTED,
///   ERR_PARAM,
///   RETRY,
///   ERR_RECOVERY_FAILURE,
///   ERR_JSON_FORMAT,
///   ERR_FAILURE,
/// }
/// ```
///
/// * Channel Name: epson_epos_printer/printer/\(id)/event
/// * Channel Type: EventChannel
/// * Codec: StandardCodec
///
/// * Method: Stream<Epos2Device> onListen()
/// * Method: void onCancel()
///
/// * Type Epos2PrinterEvent
/// ```
/// {
///   "event": String,
///   "printerJobId": String?,
///   "connection": bool,
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


public class EposPrinterPlugin : NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "epson_epos_printer/printer", binaryMessenger: registrar.messenger())
        let instance = EposPrinterPlugin(channel: channel, messenger: registrar.messenger())
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
            InstanceManager.reset()
            result(nil)
            
        case "createPrinter":
            runHandler(createPrinter, for: call, returnTo: result)
        case "destroyPrinter":
            runHandler(destroyPrinter, for: call, returnTo: result)
            
        case "sendData":
            runHandler(sendData, for: call, returnTo: result)
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
    func createPrinter(_ arguments: Any?) throws -> Any {
        guard let argMap = arguments as? Dictionary<String, Any>,
              let seriesName = argMap["series"] as? String,
              let modelName = argMap["model"] as? String else {
            throw LibraryError.badMarshal
        }
        
        let series = try encodeEpos2PrinterSeries(seriesName)
        let model = try encodeEpos2ModelLang(modelName)
        let printer = Epos2Printer.init(printerSeries: series, lang: model)!
        
        let id =  InstanceManager.register(printer: printer)
        
        let statusChannel = FlutterEventChannel(name: "epson_epos_printer/printer/\(id)/status",
                                                binaryMessenger: messenger)
        let eventChannel = FlutterEventChannel(name: "epson_epos_printer/printer/\(id)/event",
                                               binaryMessenger: messenger)
        
        let statusDelegate = PrinterStatusDelegate(printer: printer,
                                                   channel: statusChannel)
        printer.setStatusChangeEventDelegate(statusDelegate)
        
        let eventDelegate = PrinterEventDelegate(channel: eventChannel)
        printer.setReceiveEventDelegate(eventDelegate)
        
        return id;
    }
    
    
    /// * Method: void destroyPrinter(int id)
    func destroyPrinter(_ arguments: Any?) throws {
        guard let printerId = arguments as? Int32 else {
            throw LibraryError.badMarshal
        }
        
        InstanceManager.release(id: printerId)
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
        
        try check(resultCode: code)
    }
    
    /// * Method: void disconnect({id: String})
    func disconnect(_ arguments: Any?) throws {
        let printer = try instIdOnly(from: arguments)
        
        let code = printer.disconnect()
        
        try check(resultCode: code)
    }
    
    // ==========================================================================
    
    /// * Method: void sendData({id: String, args: {Long timeout=10000}})
    func sendData(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let timeout = args["timeout"] as? Int else {
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
    
    // ==========================================================================
    
    /// * Method: void addTextAlign({id: String, args: {String align}})
    func addTextAlign(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let alignName = args["align"] as? String else {
            throw LibraryError.badMarshal
        }
        let align = try encodeEpos2Align(alignName)
        
        let code = printer.addTextAlign(align)
        
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
    
    /// * Method: addTextRotate({id String, args: {Bool rotate = false}})
    func addTextRotate(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let rotate = args["rotate"] as? Bool else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addTextRotate(encodeEpos2Bool(rotate))
        
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
    
    /// * Method: void addTextLang({id: String, args: {String lang = "Default"}})
    func addTextLang(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let langName = args["lang"] as? String else {
            throw LibraryError.badMarshal
        }
        let lang = try encodeEpos2Lang(langName)
        
        let code = printer.addTextLang(lang)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addTextFont({id: String, args: {String font = "A"}})
    func addTextFont(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let fontName = args["font"] as? String else {
            throw LibraryError.badMarshal
        }
        let font = try encodeEpos2Font(fontName)
        
        let code = printer.addTextFont(font)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addTextSmooth({id: String, args: {bool smooth = false}})
    func addTextSmooth(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let smooth = args["smooth"] as? Bool else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addTextSmooth(encodeEpos2Bool(smooth))
        
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
        
        try check(resultCode: code)
    }
    
    /// * Method: void addHPosition({id: String, args: {Long position}})
    func addHPosition(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let position = args["position"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addHPosition(position)
        
        try check(resultCode: code)
    }
    
    // ==========================================================================
    
    /// * Method: void addFeedUnit({id: String, args: {Long unit}})
    func addFeedUnit(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let unit = args["unit"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addFeedUnit(unit)
        
        try check(resultCode: code)
    }
    
    /// * Method: void addFeedLine({id: String, args: {Long line}})
    func addFeedLine(_ arguments: Any?) throws {
        let (printer, args) = try instArgsDict(from: arguments)
        
        guard let line = args["line"] as? Int else {
            throw LibraryError.badMarshal
        }
        
        let code = printer.addFeedLine(line)
        
        try check(resultCode: code)
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
        
        try check(resultCode: code)
    }
    
}

class PrinterStatusDelegate :  NSObject, Epos2PtrStatusChangeDelegate, FlutterStreamHandler {
    let printer: Epos2Printer
    let channel: FlutterEventChannel
    private var eventSink: FlutterEventSink?
    
    init(printer: Epos2Printer,
         channel: FlutterEventChannel) {
        self.printer = printer
        self.channel = channel
        
        super.init()
        
        channel.setStreamHandler(self)
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        let code = printer.startMonitor()
        let error = flutterError(fromCode: code, method: "startMonitor")
        
        guard error == nil else { return error }
        
        eventSink = events
        
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        let code = printer.stopMonitor()
        let error =  flutterError(fromCode: code, method: "stopMonitor")
        
        guard error == nil else { return error }
        
        eventSink = nil
        
        return error
    }
    
    func onPtrStatusChange(_ printerObj: Epos2Printer, eventType: Int32) {
        guard let sink = eventSink else { return }
        
        do {
            sink(try decodeEpos2CallbackCode(eventType))
        } catch {
            sink(flutterError(fromError: error, method: "onPtrStatusChange"))
        }
        
    }
}

class PrinterEventDelegate :  NSObject, Epos2PtrReceiveDelegate, FlutterStreamHandler {
    let channel : FlutterEventChannel
    private var eventSink: FlutterEventSink?
    
    init( channel: FlutterEventChannel) {
        self.channel = channel
        super.init()
        channel.setStreamHandler(self)
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }
    
    func onPtrReceive(_ printerObj: Epos2Printer!, code: Int32, status: Epos2PrinterStatusInfo, printJobId: String!) {
        guard let sink = eventSink else { return }
        
        do {
            let event: Dictionary<String, Any?> = [
                "event": try decodeEpos2StatusEvent(code),
                "printerJobId": printJobId,
                "connection": try decodeEpos2Bool(status.connection, name: "Epos2PrinterStatusInfo.connection"),
                "online": try decodeEpos2OptionalBool(status.online, name: "Epos2PrinterStatusInfo.online"),
                "coverOpen": try decodeEpos2OptionalBool(status.coverOpen, name: "Epos2PrinterStatusInfo.coverOpen"),
                "paper": try decodeEpos2StatusPaper(status.paper),
                "paperFeed": try decodeEpos2OptionalBool(status.paperFeed, name: "Epos2PrinterStatusInfo.paperFeed"),
                "panelSwitch": try decodeEpos2OptionalBool(status.panelSwitch, name: "Epos2PrinterStatusInfo.panelSwitch"),
                "waitOnline": status.waitOnline, // TODO: Not documented, maybe remove this?!
                "drawer": try decodeEpos2StatusDrawer(status.drawer),
                "errorStatus": try decodeEpos2PrinterError(status.errorStatus),
                "autoRecoverError": try decodeEpos2AutoRecoverError(status.autoRecoverError),
                "buzzer": try decodeEpos2OptionalBool(status.buzzer, name: "Epos2PrinterStatusInfo.buzzer"),
                "adapter": try decodeEpos2OptionalBool(status.adapter, name: "Epos2PrinterStatusInfo.adapter"),
                "batteryLevel": try decodeEpos2BatteryLevel(status.batteryLevel),
                "removalWaiting": try decodeEpos2RemovalWaiting(status.removalWaiting),
                "unrecoverError": try decodeEpos2UnrecoverError(status.unrecoverError)
            ]
            
            sink(event)
        } catch {
            sink(flutterError(fromError: error, method: "onPtrReceive"))
        }
    }
}

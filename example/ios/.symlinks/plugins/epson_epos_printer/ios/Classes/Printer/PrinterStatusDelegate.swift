import Foundation

class PrinterStatusDelegate :  NSObject, Epos2PtrStatusChangeDelegate, FlutterStreamHandler {
    unowned let printer: Epos2Printer
    let channel: FlutterEventChannel
    private var eventSink: FlutterEventSink?

    init(id: Int32,
         messenger: FlutterBinaryMessenger,
         attachTo  printer: Epos2Printer) {

        self.printer = printer
        self.channel = FlutterEventChannel(name: "epson_epos_printer/printer/\(id)/status",
                                           binaryMessenger: messenger)

        super.init()

        channel.setStreamHandler(self)
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        let code = printer.startMonitor()
        let error = flutterError(resultCode: code, method: "startMonitor")

        guard error == nil else { return error }

        eventSink = events

        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        let code = printer.stopMonitor()
        let error = flutterError(resultCode: code, method: "stopMonitor")

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

class PrinterAsyncDelegate :  NSObject, Epos2PtrReceiveDelegate  {
    private var flutterResult: FlutterResult

    init(_ flutterResult: @escaping FlutterResult) {
        self.flutterResult = flutterResult
    }

    func onPtrReceive(_ printerObj: Epos2Printer!, code: Int32, status: Epos2PrinterStatusInfo, printJobId: String!) {
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

            flutterResult(event)
        } catch {
            flutterResult(flutterError(fromError: error, method: "onPtrReceive"))
        }
    }
}

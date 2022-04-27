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
        do {
            let code = printer.startMonitor()
            try check(returnCode: code)
            
            eventSink = events

            return nil
        } catch {
            return flutterError(fromError: error, method: "Epos2Printer.startMonitor")
        }
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        do {
            let code = printer.stopMonitor()
            try check(returnCode: code)

            eventSink = nil
            
            return nil
        } catch {
            return flutterError(fromError: error, method: "Epos2Printer.startMonitor")
        }
    }

    func onPtrStatusChange(_ printerObj: Epos2Printer, eventType: Int32) {
        guard let sink = eventSink else { return }

        do {
            sink(try decodeEpos2StatusEvent(eventType))
        } catch {
            sink(flutterError(fromError: error, method: "Epos2PtrStatusChangeDelegate.onPtrStatusChange"))
        }

    }
}

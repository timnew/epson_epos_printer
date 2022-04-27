import Foundation

class PrinterAsyncDelegate :  NSObject, Epos2PtrReceiveDelegate  {
    unowned private let printer: Epos2Printer
    private let callback: FlutterAsyncCallback

    init(_ callback: @escaping FlutterAsyncCallback, attachTo printer: Epos2Printer) {
        self.printer = printer
        self.callback = callback
        
        super.init()
        
        printer.setReceiveEventDelegate(self)
    }

    func onPtrReceive(_ printerObj: Epos2Printer!, code: Int32, status: Epos2PrinterStatusInfo, printJobId: String!) {
        // Callback should be only called once, it should be cleared after the use
        printer.setReceiveEventDelegate(nil)    
    
        do {
            let printerStatus: PrinterStatus = [
                "printerJobId": printJobId,
                "connection": try decodeEpos2OptionalBool(status.connection, name: "Epos2PrinterStatusInfo.connection"),
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
                        
            try check(callbackCode: code, printerStatus: printerStatus)
            
            callback(printer)
        } catch {
            callback(flutterError(fromError: error, method: "Epos2Printer.onPtrReceive"))
        }
    }
}

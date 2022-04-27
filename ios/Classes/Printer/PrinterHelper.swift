import Foundation

func safeDispose(printer: Epos2Printer){
    printer.setStatusChangeEventDelegate(nil)
    printer.setReceiveEventDelegate(nil)
    printer.setConnectionEventDelegate(nil)
    printer.setGet(nil)
    printer.setSetPrinterSettingExDelegate(nil)
    
    printer.clearCommandBuffer()
    printer.disconnect()
}

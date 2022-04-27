import Foundation
import Flutter

enum LibraryError : Error {
    case badMarshal
    case badEnum(name: String, value: Any)
    case invalidId(id: Int32)
    case epos2ReturnCode(code: Int32, methodOverride: String? = nil)
    case epos2CallbackCode(code: Int32, printerStatus: PrinterStatus, methodOverride: String? = nil)
}

func flutterError(fromError error: Error, method: String) -> FlutterError {
    if let libError = error as? LibraryError {
        switch libError {
        case .badMarshal:
            return FlutterError(code: "lib-BadMarshal",
                                message: "Bad Marshal from \(method)",
                                details: nil)
        
        case .badEnum(name: let name, value: let value):
            return FlutterError(code: "lib-BadEnum",
                                message: "Unknown Enum \(name) = \(value) from \(method)",
                                details: "\(name) = \(value)")
                
        case .invalidId(id: let id):
            return FlutterError(code: "lib-InvalidInstanceId",
                                message: "Invalid instance id \(id) from \(method)",
                                details: id)
            
        case .epos2ReturnCode(code: let code, let methodOverride):
            return flutterError(fromCode: code,
                                decoder: decodeEpos2ErrorStatus,
                                method: methodOverride ?? method)!
        
        case .epos2CallbackCode(code: let code, let printerStatus, let methodOverride):
            return flutterError(fromCode: code,
                                decoder: decodeEpos2CallbackCode,
                                method: methodOverride ?? method,
                                details:  printerStatus)!
        }
    }

    return FlutterError(code: "lib-Unknown", message: "Unknown Error from \(method)", details: "\(error)")
}

typealias ErrorCodeDecoder = (_ code: Int32) throws -> String

func flutterError(fromCode code: Int32,
                  decoder: ErrorCodeDecoder,
                  successCode: Int32 = 0,
                  method: String,
                  details: Any? = nil) -> FlutterError? {
    guard code != successCode else { return nil }
    
    do {
        return FlutterError(code: try decoder(code),
                            message: "EPOS2 API error from \(method)",
                            details: details)
    } catch {
        return flutterError(fromError: error, method: method)
    }
}


func flutterError(returnCode code: Int32, method: String) -> FlutterError? {
    return flutterError(fromCode: code,
                        decoder: decodeEpos2ErrorStatus,
                        method: method)
}

func flutterError(callbackCode code: Int32, method: String, printerStatus: Any?) -> FlutterError? {
    return flutterError(fromCode: code,
                        decoder: decodeEpos2CallbackCode,
                        method: method,
                        details: printerStatus)
}

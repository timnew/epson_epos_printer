import Foundation
import Flutter

enum LibraryError : Error {
    case badMarshal
    case badEnum(name: String, value: Any)
    case epos2Error(code: Int32)
    case invalidId(id: Int32)
}

func wrap(handler: (_ arguments: Any?) throws -> Any, with arguments: Any?, to callback: @escaping FlutterResult) {
    do {
        let result = try handler(arguments)
        callback(result)
    } catch {
        callback(flutterError(fromError: error))
    }
}
 
func instArgsDict(from arguments: Any?) throws -> (Epos2Printer, Dictionary<String, Any?>) {
    guard let marshalMap = arguments as? Dictionary<String, Any>,
          let id = marshalMap["id"] as? Int32,
          let argsMap = marshalMap["args"] as? Dictionary<String, Any> else {
        throw LibraryError.badMarshal
    }
    
    let printer = try InstanceManager.printer(byId: id)
 
    return (printer, argsMap)
}


func flutterError(fromError error: Error) -> FlutterError {
    if let libError = error as? LibraryError {
        switch libError {
        case .badMarshal:
            return FlutterError(code: "library", message: "Bad Marshal Structure", details: nil)
        case .badEnum(name: let name, value: let value):
            return FlutterError(code: "library", message: "Bad Enum: \(name) = \(value)", details: nil)
        case .epos2Error(code: let code):
            return flutterError(fromCode: code)!
        case .invalidId(id: let id):
            return FlutterError(code: "library", message: "Invalid instance id \(id)", details: nil)
        }
    }
    
    return FlutterError(code: "library", message: "Unexpected error", details: "\(error)")
    
}

func flutterError(fromCode resultCode: Int32) -> FlutterError? {
    guard resultCode != EPOS2_SUCCESS.rawValue else { return nil }

    return FlutterError(code: errorCodeName(from: resultCode),
                        message: errorCodeName(from: resultCode),
                        details: nil)
}

import Foundation
import Flutter

enum LibraryError : Error {
    case badMarshal
    case badEnum(name: String, value: Any)
    case epos2Error(code: Int32)
    case invalidId(id: Int32)
}

func handle(_ call: FlutterMethodCall, with handler: (_ arguments: Any?) throws -> Any, to callback: @escaping FlutterResult) {
    print("\(call.method) with \(call.arguments ?? "<nil>")")
    do {
        let result = try handler(call.arguments)
        if result is Void {
            callback(nil)
        } else {
            print("Result of method \(call.method): \(result)")
            callback(result)
        }
    } catch {
        print("Error in method \(call.method): \(error)")
        callback(flutterError(fromError: error, method: "in \(call.method)"))
    }
}

func instIdOnly(from arguments: Any?) throws -> Epos2Printer {
    guard let marshalMap = arguments as? Dictionary<String, Any>,
          let id = marshalMap["id"] as? Int32 else {
        throw LibraryError.badMarshal
    }

    let printer = try InstanceManager.printer(byId: id)

    return printer;
}

func instArgsDict(from arguments: Any?) throws -> (Epos2Printer, Dictionary<String, Any?>) {
    guard let marshalMap = arguments as? Dictionary<String, Any>,
          let id = marshalMap["id"] as? Int32,
          let args = marshalMap["args"] as? Dictionary<String, Any> else {
        throw LibraryError.badMarshal
    }

    let printer = try InstanceManager.printer(byId: id)

    return (printer, args)
}


func flutterError(fromError error: Error, method: String? = nil) -> FlutterError {
    if let libError = error as? LibraryError {
        switch libError {
        case .badMarshal:
            return FlutterError(code: "library", message: "Bad Marshal Structure", details: method)
        case .badEnum(name: let name, value: let value):
            return FlutterError(code: "library", message: "Bad Enum: \(name) = \(value)", details: method)
        case .epos2Error(code: let code):
            return flutterError(fromCode: code,  method: method)!
        case .invalidId(id: let id):
            return FlutterError(code: "library", message: "Invalid instance id \(id)", details: method)
        }
    }

    return FlutterError(code: "library", message: "Unexpected error: \(error)", details: method)
}

func flutterError(fromCode resultCode: Int32, method: String? = nil) -> FlutterError? {
    guard resultCode != EPOS2_SUCCESS.rawValue else { return nil }

    return FlutterError(code: errorCodeName(from: resultCode),
                        message: nil,
                        details: method)
}

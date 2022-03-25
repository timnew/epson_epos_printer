import Foundation
import Flutter

enum LibraryError : Error {
    case badMarshal
    case badEnum(name: String, value: Any)
    case epos2Error(code: Int32)
}

func wrap(handler: (_ arguments: Any?) throws -> Any, with arguments: Any?, to callback: @escaping FlutterResult) {
    do {
        let result = try handler(arguments)
        callback(result)
    } catch {
        callback(flutterError(fromError: error))
    }
}

func flutterError(fromError error: Error) -> FlutterError {
    switch error {
    case LibraryError.badMarshal:
        return FlutterError(code: "library", message: "Bad Marshal Structure", details: nil)
    case LibraryError.badEnum(name: let name, value: let value):
        return FlutterError(code: "library", message: "Bad Enum: \(name) = \(value)", details: nil)
    default:
        return FlutterError(code: "library", message: "Unexpected error", details: nil)
    }
}

func flutterError(fromCode resultCode: Int32) -> FlutterError? {
    guard resultCode != EPOS2_SUCCESS.rawValue else { return nil }

    return FlutterError(code: errorCodeName(from: resultCode),
                        message: errorCodeName(from: resultCode),
                        details: nil)
}

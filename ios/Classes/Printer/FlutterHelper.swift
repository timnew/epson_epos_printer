import Foundation
import Flutter

typealias FlutterCallHandler = (_ arguments: Any?) throws -> Any
typealias FlutterAsyncCallback = (_ result: Any?) -> Void
typealias FlutterAsyncCallHandler = (_ arguments: Any?, _ callback: @escaping FlutterAsyncCallback) throws -> Void

typealias PrinterStatus = Dictionary<String, Any?>

func check(returnCode: Int32, methodOverride: String? = nil) throws {
    guard returnCode == EPOS2_SUCCESS.rawValue else {
        throw LibraryError.epos2ReturnCode(code: returnCode,
                                           methodOverride: methodOverride)
    }
}

func check(callbackCode: Int32, printerStatus: PrinterStatus, methodOverride: String? = nil) throws {
    guard callbackCode == EPOS2_CODE_SUCCESS.rawValue else {
        throw LibraryError.epos2CallbackCode(code: callbackCode,
                                             printerStatus: printerStatus,
                                             methodOverride: methodOverride)
    }
}

func runHandler(_ handler: FlutterCallHandler,
                for call: FlutterMethodCall,
                returnTo callback: @escaping FlutterResult,
                apiHost: String = "Epos2Printer" ) {
    print("Method \(call.method) with \(call.arguments ?? "<nil>")")
    
    do {
        let result = try handler(call.arguments)
        if(result is Void) {
            print("Method \(call.method) scueeded")
            callback(nil)
        } else {
            print("Method \(call.method) suceeded with result \(result)")
            callback(result)
        }
    } catch {
        print("Method \(call.method) failed due to: \(error)")
        callback(flutterError(fromError: error, method: "\(apiHost).\(call.method)"))
    }
}

func runAsyncHandler(_ handler: FlutterAsyncCallHandler,
                     for call: FlutterMethodCall,
                     returnTo callback: @escaping FlutterResult,
                     apiHost: String = "Epos2Printer" ) {
    print("Async method \(call.method) with \(call.arguments ?? "<nil>")")
    
    do {
        try handler(call.arguments) { result in
            if let error = result as? FlutterError {
                print("Method \(call.method) failed in callback due to: \(error)")
            } else if result is Void {
                print("Async Method \(call.method) scueeded")
            } else {
                print("Async Method \(call.method) scueeded with result \(String(describing: result))")
            }
            
            callback(result)
        }
    } catch {
        print("Async Method \(call.method) failed on initial call due to: \(error)")
        callback(flutterError(fromError: error, method: "\(apiHost).\(call.method)"))
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

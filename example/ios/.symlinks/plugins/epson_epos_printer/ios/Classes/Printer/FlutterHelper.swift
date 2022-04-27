import Foundation
import Flutter


typealias FlutterCallHandler = (_ arguments: Any?) throws -> Any

func runHandler(_ handler: FlutterCallHandler,
                for call: FlutterMethodCall,
                returnTo callback: @escaping FlutterResult,
                apiHost: String = "Epos2Printer" ) {
    print("\(call.method) with \(call.arguments ?? "<nil>")")
    
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

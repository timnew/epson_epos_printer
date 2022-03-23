import Foundation

func checkResultCode(_ resultCode: Int32) -> FlutterError? {
    guard resultCode != EPOS2_SUCCESS.rawValue else { return nil }

    return FlutterError(code: "\(resultCode)",
                        message: resultCode2Name(resultCode),
                        details: nil)
}

fileprivate func resultCode2Name(resultCode: Int32) -> String {
    switch resultCode {
    case EPOS2_SUCCESS.rawValue:
        return "EPOS2_SUCCESS"
    case EPOS2_ERR_PARAM.rawValue:
        return "EPOS2_ERR_PARAM"
    case EPOS2_ERR_CONNECT.rawValue:
        return "EPOS2_ERR_CONNECT"
    case EPOS2_ERR_TIMEOUT.rawValue:
        return "EPOS2_ERR_TIMEOUT"
    case EPOS2_ERR_MEMORY.rawValue:
        return "EPOS2_ERR_MEMORY"
    case EPOS2_ERR_ILLEGAL.rawValue:
        return "EPOS2_ERR_ILLEGAL"
    case EPOS2_ERR_PROCESSING.rawValue:
        return "EPOS2_ERR_PROCESSING"
    case EPOS2_ERR_NOT_FOUND.rawValue:
        return "EPOS2_ERR_NOT_FOUND"
    case EPOS2_ERR_IN_USE.rawValue:
        return "EPOS2_ERR_IN_USE"
    case EPOS2_ERR_TYPE_INVALID.rawValue:
        return "EPOS2_ERR_TYPE_INVALID"
    case EPOS2_ERR_DISCONNECT.rawValue:
        return "EPOS2_ERR_DISCONNECT"
    case EPOS2_ERR_ALREADY_OPENED.rawValue:
        return "EPOS2_ERR_ALREADY_OPENED"
    case EPOS2_ERR_ALREADY_USED.rawValue:
        return "EPOS2_ERR_ALREADY_USED"
    case EPOS2_ERR_BOX_COUNT_OVER.rawValue:
        return "EPOS2_ERR_BOX_COUNT_OVER"
    case EPOS2_ERR_BOX_CLIENT_OVER.rawValue:
        return "EPOS2_ERR_BOX_CLIENT_OVER"
    case EPOS2_ERR_UNSUPPORTED.rawValue:
        return "EPOS2_ERR_UNSUPPORTED"
    case EPOS2_ERR_DEVICE_BUSY.rawValue:
        return "EPOS2_ERR_DEVICE_BUSY"
    case EPOS2_ERR_RECOVERY_FAILURE.rawValue:
        return "EPOS2_ERR_RECOVERY_FAILURE"
    default:
        return "EPOS2_ERR_FAILURE"
    }
}

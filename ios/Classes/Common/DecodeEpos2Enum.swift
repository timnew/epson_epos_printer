import Foundation
import Flutter

fileprivate func doDecodeEpos2Bool(_ value: Int32, name: String = "EPOS2_BOOL", allowNil: Bool) throws -> Bool? {
    switch value {
    case EPOS2_TRUE:
        return true
    case EPOS2_FALSE:
        return false
    case EPOS2_UNKNOWN:
        if allowNil {
            return nil
        }
        fallthrough
    default:
        throw LibraryError.badEnum(name: name, value: value)
    }
}


func decodeEpos2OptionalBool(_ value: Int32, name: String = "EPOS2_BOOL") throws -> Bool? {
    return try doDecodeEpos2Bool(value, name: name, allowNil: true)
}

func decodeEpos2Bool(_ value: Int32, name: String = "EPOS2_BOOL") throws -> Bool {
    return try doDecodeEpos2Bool(value, name: name, allowNil: false)!
}

func decodeTriStateName(_ value: Int32, name: String = "EPOS2_BOOL", trueName: String, falseName: String, unknownName: String) throws -> String {
    switch value {
    case EPOS2_TRUE:
        return trueName
    case EPOS2_FALSE:
        return falseName
    case EPOS2_UNKNOWN:
        return unknownName
    default:
        throw LibraryError.badEnum(name: name, value: value)
    }
}

func decodeEpos2ErrorStatus(_ code: Int32) throws -> String {
    switch code {
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
        throw LibraryError.badEnum(name: "Epos2ErrorStatus", value: code)
    }
}

func decodeEpos2CallbackCode(_ code: Int32) throws -> String {
    switch code {
    case EPOS2_CODE_SUCCESS.rawValue:
        return "EPOS2_CODE_SUCCESS"
    case EPOS2_CODE_ERR_TIMEOUT.rawValue:
        return "EPOS2_CODE_ERR_TIMEOUT"
    case EPOS2_CODE_ERR_NOT_FOUND.rawValue:
        return "EPOS2_CODE_ERR_NOT_FOUND"
    case EPOS2_CODE_ERR_AUTORECOVER.rawValue:
        return "EPOS2_CODE_ERR_AUTORECOVER"
    case EPOS2_CODE_ERR_COVER_OPEN.rawValue:
        return "EPOS2_CODE_ERR_COVER_OPEN"
    case EPOS2_CODE_ERR_CUTTER.rawValue:
        return "EPOS2_CODE_ERR_CUTTER"
    case EPOS2_CODE_ERR_MECHANICAL.rawValue:
        return "EPOS2_CODE_ERR_MECHANICAL"
    case EPOS2_CODE_ERR_EMPTY.rawValue:
        return "EPOS2_CODE_ERR_EMPTY"
    case EPOS2_CODE_ERR_UNRECOVERABLE.rawValue:
        return "EPOS2_CODE_ERR_UNRECOVERABLE"
    case EPOS2_CODE_ERR_SYSTEM.rawValue:
        return "EPOS2_CODE_ERR_SYSTEM"
    case EPOS2_CODE_ERR_PORT.rawValue:
        return "EPOS2_CODE_ERR_PORT"
    case EPOS2_CODE_ERR_INVALID_WINDOW.rawValue:
        return "EPOS2_CODE_ERR_INVALID_WINDOW"
    case EPOS2_CODE_ERR_JOB_NOT_FOUND.rawValue:
        return "EPOS2_CODE_ERR_JOB_NOT_FOUND"
    case EPOS2_CODE_PRINTING.rawValue:
        return "EPOS2_CODE_PRINTING"
    case EPOS2_CODE_ERR_SPOOLER.rawValue:
        return "EPOS2_CODE_ERR_SPOOLER"
    case EPOS2_CODE_ERR_BATTERY_LOW.rawValue:
        return "EPOS2_CODE_ERR_BATTERY_LOW"
    case EPOS2_CODE_ERR_TOO_MANY_REQUESTS.rawValue:
        return "EPOS2_CODE_ERR_TOO_MANY_REQUESTS"
    case EPOS2_CODE_ERR_REQUEST_ENTITY_TOO_LARGE.rawValue:
        return "EPOS2_CODE_ERR_REQUEST_ENTITY_TOO_LARGE"
    case EPOS2_CODE_CANCELED.rawValue:
        return "EPOS2_CODE_CANCELED"
    case EPOS2_CODE_ERR_NO_MICR_DATA.rawValue:
        return "EPOS2_CODE_ERR_NO_MICR_DATA"
    case EPOS2_CODE_ERR_ILLEGAL_LENGTH.rawValue:
        return "EPOS2_CODE_ERR_ILLEGAL_LENGTH"
    case EPOS2_CODE_ERR_NO_MAGNETIC_DATA.rawValue:
        return "EPOS2_CODE_ERR_NO_MAGNETIC_DATA"
    case EPOS2_CODE_ERR_RECOGNITION.rawValue:
        return "EPOS2_CODE_ERR_RECOGNITION"
    case EPOS2_CODE_ERR_READ.rawValue:
        return "EPOS2_CODE_ERR_READ"
    case EPOS2_CODE_ERR_NOISE_DETECTED.rawValue:
        return "EPOS2_CODE_ERR_NOISE_DETECTED"
    case EPOS2_CODE_ERR_PAPER_JAM.rawValue:
        return "EPOS2_CODE_ERR_PAPER_JAM"
    case EPOS2_CODE_ERR_PAPER_PULLED_OUT.rawValue:
        return "EPOS2_CODE_ERR_PAPER_PULLED_OUT"
    case EPOS2_CODE_ERR_CANCEL_FAILED.rawValue:
        return "EPOS2_CODE_ERR_CANCEL_FAILED"
    case EPOS2_CODE_ERR_PAPER_TYPE.rawValue:
        return "EPOS2_CODE_ERR_PAPER_TYPE"
    case EPOS2_CODE_ERR_WAIT_INSERTION.rawValue:
        return "EPOS2_CODE_ERR_WAIT_INSERTION"
    case EPOS2_CODE_ERR_ILLEGAL.rawValue:
        return "EPOS2_CODE_ERR_ILLEGAL"
    case EPOS2_CODE_ERR_INSERTED.rawValue:
        return "EPOS2_CODE_ERR_INSERTED"
    case EPOS2_CODE_ERR_WAIT_REMOVAL.rawValue:
        return "EPOS2_CODE_ERR_WAIT_REMOVAL"
    case EPOS2_CODE_ERR_DEVICE_BUSY.rawValue:
        return "EPOS2_CODE_ERR_DEVICE_BUSY"
    case EPOS2_CODE_ERR_GET_JSON_SIZE.rawValue:
        return "EPOS2_CODE_ERR_GET_JSON_SIZE"
    case EPOS2_CODE_ERR_IN_USE.rawValue:
        return "EPOS2_CODE_ERR_IN_USE"
    case EPOS2_CODE_ERR_CONNECT.rawValue:
        return "EPOS2_CODE_ERR_CONNECT"
    case EPOS2_CODE_ERR_DISCONNECT.rawValue:
        return "EPOS2_CODE_ERR_DISCONNECT"
    case EPOS2_CODE_ERR_DIFFERENT_MODEL.rawValue:
        return "EPOS2_CODE_ERR_DIFFERENT_MODEL"
    case EPOS2_CODE_ERR_DIFFERENT_VERSION.rawValue:
        return "EPOS2_CODE_ERR_DIFFERENT_VERSION"
    case EPOS2_CODE_ERR_MEMORY.rawValue:
        return "EPOS2_CODE_ERR_MEMORY"
    case EPOS2_CODE_ERR_PROCESSING.rawValue:
        return "EPOS2_CODE_ERR_PROCESSING"
    case EPOS2_CODE_ERR_DATA_CORRUPTED.rawValue:
        return "EPOS2_CODE_ERR_DATA_CORRUPTED"
    case EPOS2_CODE_ERR_PARAM.rawValue:
        return "EPOS2_CODE_ERR_PARAM"
    case EPOS2_CODE_RETRY.rawValue:
        return "EPOS2_CODE_RETRY"
    case EPOS2_CODE_ERR_RECOVERY_FAILURE.rawValue:
        return "EPOS2_CODE_ERR_RECOVERY_FAILURE"
    case EPOS2_CODE_ERR_JSON_FORMAT.rawValue:
        return "EPOS2_CODE_ERR_JSON_FORMAT"
    case EPOS2_CODE_ERR_FAILURE.rawValue:
        return "EPOS2_CODE_ERR_FAILURE"
    default:
        throw LibraryError.badEnum(name: "Epos2CallbackCode", value: code)
    }
}

func decodeEpos2StatusEvent(_ code: Int32) throws -> String {
    switch code {
    case EPOS2_EVENT_ONLINE.rawValue:
        return "ONLINE"
    case EPOS2_EVENT_OFFLINE.rawValue:
        return "OFFLINE"
    case EPOS2_EVENT_POWER_OFF.rawValue:
        return "POWER_OFF"
    case EPOS2_EVENT_COVER_CLOSE.rawValue:
        return "COVER_CLOSE"
    case EPOS2_EVENT_COVER_OPEN.rawValue:
        return "COVER_OPEN"
    case EPOS2_EVENT_PAPER_OK.rawValue:
        return "PAPER_OK"
    case EPOS2_EVENT_PAPER_NEAR_END.rawValue:
        return "PAPER_NEAR_END"
    case EPOS2_EVENT_PAPER_EMPTY.rawValue:
        return "PAPER_EMPTY"
    case EPOS2_EVENT_DRAWER_HIGH.rawValue:
        return "DRAWER_HIGH"
    case EPOS2_EVENT_DRAWER_LOW.rawValue:
        return "DRAWER_LOW"
    case EPOS2_EVENT_BATTERY_ENOUGH.rawValue:
        return "BATTERY_ENOUGH"
    case EPOS2_EVENT_BATTERY_EMPTY.rawValue:
        return "BATTERY_EMPTY"
    case EPOS2_EVENT_INSERTION_WAIT_SLIP.rawValue:
        return "INSERTION_WAIT_SLIP"
    case EPOS2_EVENT_INSERTION_WAIT_VALIDATION.rawValue:
        return "INSERTION_WAIT_VALIDATION"
    case EPOS2_EVENT_INSERTION_WAIT_MICR.rawValue:
        return "INSERTION_WAIT_MICR"
    case EPOS2_EVENT_INSERTION_WAIT_NONE.rawValue:
        return "INSERTION_WAIT_NONE"
    case EPOS2_EVENT_REMOVAL_WAIT_PAPER.rawValue:
        return "REMOVAL_WAIT_PAPER"
    case EPOS2_EVENT_REMOVAL_WAIT_NONE.rawValue:
        return "REMOVAL_WAIT_NONE"
    case EPOS2_EVENT_SLIP_PAPER_OK.rawValue:
        return "SLIP_PAPER_OK"
    case EPOS2_EVENT_SLIP_PAPER_EMPTY.rawValue:
        return "SLIP_PAPER_EMPTY"
    case EPOS2_EVENT_AUTO_RECOVER_ERROR.rawValue:
        return "AUTO_RECOVER_ERROR"
    case EPOS2_EVENT_AUTO_RECOVER_OK.rawValue:
        return "AUTO_RECOVER_OK"
    case EPOS2_EVENT_UNRECOVERABLE_ERROR.rawValue:
        return "UNRECOVERABLE_ERROR"
    default:
        throw LibraryError.badEnum(name: "Epos2StatusEvent", value: code)
    }
}

func decodeEpos2StatusPaper(_ code: Int32) throws -> String? {
    switch code {
    case EPOS2_PAPER_OK.rawValue:
        return "OK"
    case EPOS2_PAPER_NEAR_END.rawValue:
        return "NEAR_END"
    case EPOS2_PAPER_EMPTY.rawValue:
        return "EMPTY"
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2StatusPaper", value: code)
    }
}

func decodeEpos2StatusDrawer(_ code: Int32) throws -> Bool? {
    switch code {
    case EPOS2_DRAWER_HIGH.rawValue:
        return true
    case EPOS2_DRAWER_LOW.rawValue:
        return false
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2StatusDrawer", value: code)
    }
}

func decodeEpos2PrinterError(_ code: Int32) throws -> String? {
    switch code {
    case EPOS2_NO_ERR.rawValue:
        return "NO_ERR"
    case EPOS2_MECHANICAL_ERR.rawValue:
        return "MECHANICAL_ERR"
    case EPOS2_AUTOCUTTER_ERR.rawValue:
        return "AUTOCUTTER_ERR"
    case EPOS2_UNRECOVER_ERR.rawValue:
        return "UNRECOVER_ERR"
    case EPOS2_AUTORECOVER_ERR.rawValue:
        return "AUTORECOVER_ERR"
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2PrinterError", value: code)
    }
}

func decodeEpos2AutoRecoverError(_ code: Int32) throws -> String? {
    switch code {
    case EPOS2_HEAD_OVERHEAT.rawValue:
        return "HEAD_OVERHEAT"
    case EPOS2_MOTOR_OVERHEAT.rawValue:
        return "MOTOR_OVERHEAT"
    case EPOS2_BATTERY_OVERHEAT.rawValue:
        return "BATTERY_OVERHEAT"
    case EPOS2_WRONG_PAPER.rawValue:
        return "WRONG_PAPER"
    case EPOS2_COVER_OPEN.rawValue:
        return "COVER_OPEN"
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2AutoRecoverError", value: code)
    }
}

func decodeEpos2BatteryLevel(_ code: Int32) throws -> Int32? {
    switch code {
    case EPOS2_BATTERY_LEVEL_0.rawValue:
        return 0
    case EPOS2_BATTERY_LEVEL_1.rawValue:
        return 1
    case EPOS2_BATTERY_LEVEL_2.rawValue:
        return 2
    case EPOS2_BATTERY_LEVEL_3.rawValue:
        return 3
    case EPOS2_BATTERY_LEVEL_4.rawValue:
        return 4
    case EPOS2_BATTERY_LEVEL_5.rawValue:
        return 5
    case EPOS2_BATTERY_LEVEL_6.rawValue:
        return 6
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2BatteryLevel", value: code)
    }
}

func decodeEpos2RemovalWaiting(_ code: Int32) throws -> String? {
    switch code {
    case EPOS2_REMOVAL_WAIT_PAPER.rawValue:
        return "PAPER"
    case EPOS2_REMOVAL_WAIT_NONE.rawValue:
        return "NONE"
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2RemovalWaiting", value: code)
    }
}

func decodeEpos2UnrecoverError(_ code: Int32) throws -> String? {
    switch code {
    case EPOS2_HIGH_VOLTAGE_ERR.rawValue:
        return "HIGH_VOLTAGE_ERR"
    case EPOS2_LOW_VOLTAGE_ERR.rawValue:
        return "LOW_VOLTAGE_ERR"
    case EPOS2_UNKNOWN:
        return nil
    default:
        throw LibraryError.badEnum(name: "Epos2UnrecoverError", value: code)
    }
}



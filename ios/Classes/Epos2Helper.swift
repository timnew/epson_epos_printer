import Foundation
import Flutter

func check(resultCode: Int32) throws {
    guard resultCode == EPOS2_SUCCESS.rawValue else {
        throw LibraryError.epos2Error(code: resultCode)
    }
}

func errorCodeName(from resultCode: Int32) -> String {
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


func epos2Series(byName name: String) throws -> Int32 {
    switch name {
    case "TM_M10":
        return EPOS2_TM_M10.rawValue;
    case "TM_M30":
        return EPOS2_TM_M30.rawValue;
    case "TM_M30II":
        return EPOS2_TM_M30II.rawValue;
    case "TM_M50":
        return EPOS2_TM_M50.rawValue;
    case "TM_P20":
        return EPOS2_TM_P20.rawValue;
    case "TM_P60":
        return EPOS2_TM_P60.rawValue;
    case "TM_P60II":
        return EPOS2_TM_P60II.rawValue;
    case "TM_P80":
        return EPOS2_TM_P80.rawValue;
    case "TM_T20":
        return EPOS2_TM_T20.rawValue;
    case "TM_T60":
        return EPOS2_TM_T60.rawValue;
    case "TM_T70":
        return EPOS2_TM_T70.rawValue;
    case "TM_T81":
        return EPOS2_TM_T81.rawValue;
    case "TM_T82":
        return EPOS2_TM_T82.rawValue;
    case "TM_T83":
        return EPOS2_TM_T83.rawValue;
    case "TM_T83III":
        return EPOS2_TM_T83III.rawValue;
    case "TM_T88":
        return EPOS2_TM_T88.rawValue;
    case "TM_T88VII":
        return EPOS2_TM_T88VII.rawValue;
    case "TM_T90":
        return EPOS2_TM_T90.rawValue;
    case "TM_T100":
        return EPOS2_TM_T100.rawValue;
    case "TM_U220":
        return EPOS2_TM_U220.rawValue;
    case "TM_U330":
        return EPOS2_TM_U330.rawValue;
    case "TM_L90":
        return EPOS2_TM_L90.rawValue;
    case "TM_L90LFC":
        return EPOS2_TM_L90LFC.rawValue;
    case "TM_L100":
        return EPOS2_TM_L100.rawValue;
    case "TM_H6000":
        return EPOS2_TM_H6000.rawValue;
    default:
        throw LibraryError.badEnum(name: "epos2Series", value: name)
    }
}

func epos2Model(byName name: String) throws -> Int32 {
    switch name {
    case "ANK":
      return EPOS2_MODEL_ANK.rawValue;
    case "CHINESE":
      return EPOS2_MODEL_CHINESE.rawValue;
    case "TAIWAN":
      return EPOS2_MODEL_TAIWAN.rawValue;
    case "KOREAN":
      return EPOS2_MODEL_KOREAN.rawValue;
    case "THAI":
      return EPOS2_MODEL_THAI.rawValue;
    case "SOUTHASIA":
      return EPOS2_MODEL_SOUTHASIA.rawValue;
    default:
        throw LibraryError.badEnum(name: "epos2Model", value: name)
    }
}

import Foundation
import Flutter

func encodeEpos2Bool(_ value: Bool) -> Int32 {
    return value ? EPOS2_TRUE : EPOS2_FALSE
}

func encodeEpos2PrinterSeries(_ name: String) throws -> Int32 {
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
        throw LibraryError.badEnum(name: "Epos2Series", value: name)
    }
}

func encodeEpos2ModelLang(_ name: String) throws -> Int32 {
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
    case "SOUTH_ASIA":
      return EPOS2_MODEL_SOUTHASIA.rawValue;
    default:
        throw LibraryError.badEnum(name: "Epos2Model", value: name)
    }
}

func encodeEpos2Align(_ name: String) throws -> Int32 {
    switch name {
    case "DEFAULT":
      return EPOS2_PARAM_DEFAULT
    case "LEFT":
      return EPOS2_ALIGN_LEFT.rawValue
    case "CENTER":
      return EPOS2_ALIGN_CENTER.rawValue
    case "RIGHT":
      return EPOS2_ALIGN_RIGHT.rawValue
    default:
        throw LibraryError.badEnum(name: "Epos2Align", value: name)
    }
}

func encodeEpos2Cut(_ name: String) throws -> Int32 {
    switch name {
    case "DEFAULT":
      return EPOS2_PARAM_DEFAULT
    case "CUT_FEED":
      return EPOS2_CUT_FEED.rawValue
    case "CUT_NO_FEED":
      return EPOS2_CUT_NO_FEED.rawValue
    case "CUT_RESERVE":
      return EPOS2_CUT_RESERVE.rawValue
    default:
        throw LibraryError.badEnum(name: "Epos2Cut", value: name)
    }
}

func encodeEpos2Lang(_ name: String) throws  -> Int32 {
    switch name {
    case "DEFAULT":
      return EPOS2_PARAM_DEFAULT
    case "EN":
        return EPOS2_LANG_EN.rawValue
    case "JA":
        return EPOS2_LANG_JA.rawValue
    case "ZH_CN":
        return EPOS2_LANG_ZH_CN.rawValue
    case "ZH_TW":
        return EPOS2_LANG_ZH_TW.rawValue
    case "KO":
        return EPOS2_LANG_KO.rawValue
    case "TH":
        return EPOS2_LANG_TH.rawValue
    case "VI":
        return EPOS2_LANG_VI.rawValue
    case "MULTI":
        return EPOS2_LANG_MULTI.rawValue
    default:
        throw LibraryError.badEnum(name: "Epos2Lang", value: name)
    }
}

func encodeEpos2Font(_ name: String) throws  -> Int32 {
    switch name {
    case "DEFAULT":
      return EPOS2_PARAM_DEFAULT
    case "A":
        return EPOS2_FONT_A.rawValue
    case "B":
        return EPOS2_FONT_B.rawValue
    case "C":
        return EPOS2_FONT_C.rawValue
    case "D":
        return EPOS2_FONT_D.rawValue
    case "E":
        return EPOS2_FONT_E.rawValue
    default:
        throw LibraryError.badEnum(name: "Epos2Font", value: name)
    }
}

func encodeEpos2Color(_ name: String) throws  -> Int32 {
    switch name {
    case "DEFAULT":
      return EPOS2_PARAM_DEFAULT
    case "TRANSPARENT":
        return EPOS2_COLOR_NONE.rawValue
    case "COLOR_1":
        return EPOS2_COLOR_1.rawValue
    case "COLOR_2":
        return EPOS2_COLOR_2.rawValue
    case "COLOR_3":
        return EPOS2_COLOR_3.rawValue
    case "COLOR_4":
        return EPOS2_COLOR_4.rawValue
    default:
        throw LibraryError.badEnum(name: "Epos2Font", value: name)
    }
}


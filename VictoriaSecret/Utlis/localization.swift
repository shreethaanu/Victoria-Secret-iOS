//
//  localization.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 28/01/23.
//

import Foundation

class Localization {
    static func string(key: String) -> String {
        return NSLocalizedString(key, tableName: "Localizable",
                                 bundle: Bundle(for: self),
                                 value: "",
                                 comment: "")
    }
}

struct Login {
        
        static let loginSuccessIndicator = "SUCESS"
        static let passwordError = "INVALID_PASSWORD"
        static let userNameError = "INVALID_USERNAME"
        //static let cardNumberInfo = "CARD_NUMBER_INFO"
    }

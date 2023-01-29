//
//  LoginViewModel.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 28/01/23.
//

import Foundation

class LoginViewModel {
    
    var loginName: String
    var password: String
    
    init(loginName: String, password: String) {
        self.loginName = loginName
        self.password = password
    }
    
    func isValidPassword() -> Bool {
        let passwordTrim  = password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: passwordTrim)

    }

    func isLoginnNameValid() -> Bool{
        if loginName.isEmpty {
            return false
        }
        return true
    }

    func isLoginSuccess() ->  String {
        if isValidPassword() && isLoginnNameValid() {
            return "Success"
        }
        else if isLoginnNameValid() && !isValidPassword() {
            return Localization.string(key: Login.passwordError)
        }
        else {
            return Localization.string(key: Login.userNameError)
        }
        
    }
}

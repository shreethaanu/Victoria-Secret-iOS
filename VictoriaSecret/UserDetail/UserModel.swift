//
//  UserModel.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

struct UserModel: Decodable {
    var id: String?
    var username: String
    var firstname: String
    var lastName: String
    var dob: String
    var address: String
    var pointsEarned: String
    var walletBalance: String
}

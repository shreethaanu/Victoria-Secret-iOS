//
//  UserDetailsCommunicator.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

class UserDetailsCommunicator {

    func getUserDetails(url: URL, completion: @escaping (Result<UserModel?, Error>) -> ()) {
        webServiceManager.shared.makeServiceCall(url: url) { (json: UserModel?) in
            if let userData = json {
                completion(.success(userData))
            }
        } failure: { error in
            if let error = error {
                completion(.failure(error))
            }
        }
    }
}


//
//  UserDetailsViewModel.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import Foundation

class UserDetailsViewModel {
    
    var communicator: UserDetailsCommunicator = UserDetailsCommunicator()
    var userData: UserModel?
    var errorDescription: Error?

    func fetchUserList(completion: @escaping (Result<UserModel?, Error>) -> ()) {
        communicator.getUserDetails(url: URL(string: GlobalConstant.BaseUrl + GlobalConstant.profileAPI)!) { [weak self] userDetail in
            switch userDetail {
            case .success(let userData):
                self?.userData = userData
            case .failure(let error):
                self?.errorDescription = error
                print(error)
            }
            completion(userDetail)
        }
    }
}



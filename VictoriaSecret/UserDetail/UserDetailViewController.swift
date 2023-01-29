//
//  UserDetailViewController.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 29/01/23.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!

    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var dob: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    var viewModel: UserDetailsViewModel = UserDetailsViewModel()
    var userDetails: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadUserData()
    }

    func loadUserData(){
        viewModel.fetchUserList { [weak self] userData in
            DispatchQueue.main.async {
                self?.view.activityStartAnimating(activityColor: UIColor.black, backgroundColor: UIColor.black.withAlphaComponent(0.5))
            }
            switch userData {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.popAlertView(AlertTitle: "Error", AlertDesc: "An unknown error occured while loading the products")
                }
            case .success(_):
                self?.userDetails = self?.viewModel.userData
                DispatchQueue.main.async {
                    self?.populateUserData()
                    self?.view.activityStopAnimating()
                }
            }
        }
    }
    
    func populateUserData(){
        if let userDetails = userDetails {
            userName.text = userDetails.username
            firstName.text = "First Name: " + userDetails.firstname
            lastName.text = "Last Name: " + userDetails.lastName
            dob.text = "Date of birth: " + userDetails.dob
            address.text = "Address: " + userDetails.address
        }
       
    }
}

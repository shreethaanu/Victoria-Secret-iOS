//
//  LoginViewController.swift
//  VictoriaSecret
//
//  Created by ShreeThaanu on 28/01/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPassword: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginAction(_ sender: Any) {
        if let username = userName.text, let passwordText = password.text {
            let viewModel = LoginViewModel(loginName: username, password: passwordText)
            let loginState = viewModel.isLoginSuccess()
            if loginState == "Success" {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "productListViewController") as! productListViewController
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
            else {
                popAlertView(AlertTitle: "Login Error", AlertDesc: loginState)
            }
            }
        }
    }

enum errorstate {
    case success
    case failure
}

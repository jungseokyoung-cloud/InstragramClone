//
//  LoginViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        print("loginButton Pressed")
    }
    @IBAction func DontHaveAcoountPressed(_ sender: UIButton) {
    }

}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            LoginButtonPressed(LoginButton)
        }
        
        return true
    }
    
}

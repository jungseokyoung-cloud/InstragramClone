//
//  RegisterViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

class RegisterViewController: UIViewController{

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        if let userName = userNameTextField.text, let password = passwordTextField.text {
            print("\(userName), \(password)")
        }
    }

}
//MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder() //이걸로 커서 옮겨줌
        }
        else if textField == passwordTextField {
            RegisterButtonPressed(RegisterButton)
        }
        
        return true
    }
    
}

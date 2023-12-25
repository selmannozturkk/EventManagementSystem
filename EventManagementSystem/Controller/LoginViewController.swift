//
//  LoginViewController.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let userdDatabase = UserDatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if isValidUser() {
            if emailTextField.text == "admin" {
                userdDatabase.currentUser = userdDatabase.getAllUsers()[0]
            } else {
                userdDatabase.currentUser = userdDatabase.getAllUsers()[1]
            }
            performSegue(withIdentifier: "goEvents", sender: self)
            
        } else {
            view.showToast(message: "Please check your informations again!", duration: 3.0)
        }
    }
    
    func isValidUser() -> Bool {
        return emailTextField.text?.count ?? 0 > 0
        && passwordTextField.text?.count ?? 0 > 0
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

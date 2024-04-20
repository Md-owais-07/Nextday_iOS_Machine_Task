//
//  ViewController.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var lostButton: UIButton!
    @IBOutlet weak var registerButtonSwitch: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    var viewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton(googleButton)
        styleButton(facebookButton)
        cornerRadius(loginButton)
        gradientColor(loginButton)
        textFieldStyle(emailView)
        textFieldStyle(passwordView)
        
    }
    
    @IBAction func loginButtonpapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Showing an alert if username or password is empty
            showAlert(message: "Please enter email and password.")
            return
        }
        
        ApiManager.shared.registerUser(email: email, password: password) { result in
            switch result {
            case.success(let data):
                if data != nil {
                    self.showAlert(message: "Token: \(String(describing: data))")
                    print(data!)
                }
            case.failure(let error):
                self.showAlert(message: "Login failed. Please try again.")
                print(error.localizedDescription)
            }
        }
    }
    

}

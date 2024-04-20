//
//  ViewController.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
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
        emailTextField.delegate = self
        passwordTextField.delegate = self
        hideKeyboardWhenTappedAround()
        styleButton(googleButton)
        styleButton(facebookButton)
        cornerRadius(loginButton)
        gradientColor(loginButton)
        textFieldStyle(emailView)
        textFieldStyle(passwordView)
        
    }
    
    @IBAction func loginButtonpapped(_ sender: UIButton) 
    {
        if let email = emailTextField.text, let password = passwordTextField.text
        {
            if !email.validateEmailId() {
                openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            } else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Password must be at least 1 Alphabet and 1 Number", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            } else {
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
        else
        {
            openAlert(title: "Alert", message: "Please Enter Email and Password.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
    

}

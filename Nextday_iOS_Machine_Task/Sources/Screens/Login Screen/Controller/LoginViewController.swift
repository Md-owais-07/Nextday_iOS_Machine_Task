//
//  LoginTableViewController.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 21/04/24.
//

import UIKit

class LoginViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var lodtButton: UIButton!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var hidePasswordButton: UIButton!
    
    var viewModel = ProductsListViewModel()
    var isPasswordVisible: Bool = false

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
        passwordTextField.isSecureTextEntry = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any)
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
    
    @IBAction func hidePasswordButtonTapped(_ sender: Any) 
    {
        isPasswordVisible.toggle()
        let imageName = isPasswordVisible ? "eye.slash.fill" : "eye"
        hidePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
        passwordTextField.isSecureTextEntry = !isPasswordVisible
    }
    
    @IBAction func googleButtonTapped(_ sender: Any) {
        print("googleButtonTapped")
    }
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
        print("facebookButtonTapped")
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        print("registerButtonTapped")
    }
    

}

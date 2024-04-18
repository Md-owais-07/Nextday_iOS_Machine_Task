//
//  LoginViewModel.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 19/04/24.
//

import UIKit

extension LoginViewController {
    func showAlert(message: String) {
            let alertController = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    
    func styleButton(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.black.cgColor
    }
}

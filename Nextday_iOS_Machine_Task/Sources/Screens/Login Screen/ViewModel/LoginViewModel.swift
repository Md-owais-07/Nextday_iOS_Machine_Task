//
//  LoginViewModel.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 19/04/24.
//

import UIKit

extension LoginViewController {
    func showAlert(message: String) 
    {
            let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.navigationController?.pushViewController(AppController.shared.productsList, animated: true)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }))
            present(alertController, animated: true, completion: nil)
        }
    
    func styleButton(_ button: UIButton) 
    {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldStyle(_ view: UIView) 
    {
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
    }
    
    func gradientColor(_ button: UIButton) 
    {
        let colors: [UIColor] = [.blue, .purple, .systemPink]
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 1, y: 1)
        button.applyGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
    }
    
    func cornerRadius(_ button: UIButton) 
    {
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
    }
}

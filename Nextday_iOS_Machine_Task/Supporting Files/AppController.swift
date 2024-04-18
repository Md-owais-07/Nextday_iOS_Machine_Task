//
//  AppController.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import UIKit

class AppStoryboard {
    static let shared = AppStoryboard()
    
    var Main: UIStoryboard {
        UIStoryboard(name: "Main", bundle: nil)
    }
}

class AppController {
    static let shared = AppController()
    
    var productsList: ProductsListViewController {
        AppStoryboard.shared.Main.instantiateViewController(withIdentifier: "pvc") as? ProductsListViewController ?? ProductsListViewController()
    }
    var DetailsView: DetailsVC {
        AppStoryboard.shared.Main.instantiateViewController(withIdentifier: "DetailsVC_id") as? DetailsVC ?? DetailsVC()
    }
    
}

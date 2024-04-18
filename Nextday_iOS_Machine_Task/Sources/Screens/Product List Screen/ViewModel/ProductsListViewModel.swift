//
//  ProductsListViewModel.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import UIKit

class ProductsListViewModel {
    var products = [Product]()
    
    func getProducts(completion: @escaping () -> Void) {
        ApiManager.shared.fetchProducts { product, error in
            if let product = product {
                self.products = product
                completion()
            }
        }
    }
}



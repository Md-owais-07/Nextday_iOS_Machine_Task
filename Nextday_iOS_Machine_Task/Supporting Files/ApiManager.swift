//
//  ApiManager.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import Foundation
import UIKit

class ApiManager {
    static let shared = ApiManager()
    
    func registerUser(email: String, password: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        
        guard let url = URL(string: Constant.shared.api) else { return }
        let userData = UserRegistration(email: email, password: password)
        
        // Create a URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(userData)
            print(jsonData)
        } catch {
            completion(.failure(error))
            return
        }
        
        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        task.resume()
    }
    
    func fetchProducts(handler: @escaping ([Product]?, String?) -> Void) {
        guard let url = URL(string: Constant.shared.productApi) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
                let httpResponse = response as! HTTPURLResponse
                if (httpResponse.statusCode == 200) {
                    let jsonData = try? JSONDecoder().decode([Product].self, from: data)
                    handler(jsonData, nil)
                    print(jsonData!)
                } else {
                    handler(nil, "Error!! Handler")
                }
        }
        task.resume()
    }
    
}

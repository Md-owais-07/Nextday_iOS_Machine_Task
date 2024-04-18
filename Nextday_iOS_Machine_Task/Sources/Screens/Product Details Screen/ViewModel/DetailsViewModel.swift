//
//  DetailsViewModel.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 19/04/24.
//

import UIKit

extension DetailsVC {
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
}

//
//  DetailsVC.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 19/04/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    var imgPass: String?
    var textPass: String?
    
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imgUrlString = imgPass, let imgUrl = URL(string: imgUrlString) {
            // Start an asynchronous task to download the image
            downloadImage(from: imgUrl) { (image) in
                DispatchQueue.main.async {
                    self.detailsImage.image = image
                }
            }
        }
        detailsText.text = textPass
    }
    
}

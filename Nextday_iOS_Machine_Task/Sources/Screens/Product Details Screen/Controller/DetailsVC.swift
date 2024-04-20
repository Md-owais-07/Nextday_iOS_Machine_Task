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
    @IBOutlet weak var likeButton: UIButton!
    
    var viewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imgUrlString = imgPass, let imgUrl = URL(string: imgUrlString)
        {
            // Start an asynchronous task to download the image
            downloadImage(from: imgUrl) { (image) in
                DispatchQueue.main.async 
                {
                    self.detailsImage.image = image
                }
            }
        }
        detailsText.text = textPass
    }
    
    @IBAction func backButton(_ sender: Any) 
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        if likeButton.tag == 0
        {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = UIColor.red
            likeButton.tag = 1
            print("Like button tapped...")
        }
        else
        {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = UIColor.black
            likeButton.tag = 0
            print("Unlike button tapped...")
        }
    }
    
}

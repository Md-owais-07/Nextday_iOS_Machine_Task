//
//  ProductsListTableViewCell.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import UIKit

class ProductsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    var viewModel = ProductsListViewModel()
    var likeButtonAction: (() -> Void)?
    
}


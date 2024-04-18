//
//  ProductsListViewController.swift
//  Nextday_iOS_Machine_Task
//
//  Created by Mohammad Owais on 18/04/24.
//

import UIKit

class ProductsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductsListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        loadData()
    }
    
    func loadData() {
        viewModel.getProducts {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductsListTableViewCell else { return UITableViewCell() }
        let cellData = viewModel.products[indexPath.row]
        cell.imgView.downloaded(from: viewModel.products[indexPath.row].image)
        cell.imgView.contentMode = .scaleAspectFill
        cell.imgView.layer.cornerRadius = cell.imgView.frame.height/2
        cell.labelView.text = cellData.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppController.shared.DetailsView
        vc.imgPass = viewModel.products[indexPath.row].image
        vc.textPass = viewModel.products[indexPath.row].title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

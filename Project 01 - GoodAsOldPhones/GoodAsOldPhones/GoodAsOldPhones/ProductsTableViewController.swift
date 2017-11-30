//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by TAO on 2017/11/30.
//  Copyright © 2017年 SwaggyT. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    private var products: [Product]?
    private let cellID = "productCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    private func loadData() {
        
        products = [
            Product(name: "1907 Wall Set", cellImageName: "cell01", fullscreenImageName: "fullscreen01"),
            Product(name: "1921 Dial Phone", cellImageName: "cell02", fullscreenImageName: "fullscreen02"),
            Product(name: "1937 Desk Set", cellImageName: "cell03", fullscreenImageName: "fullscreen03"),
            Product(name: "1984 Moto Portable", cellImageName: "cell04", fullscreenImageName: "fullscreen04")]
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

        guard let products = products else { return cell }
        
        cell.textLabel?.text = products[indexPath.row].name
        
        if let imageName = products[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }

        return cell
    }

    // MARK: - View Transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("push product vc")
        
        if segue.identifier == "showProduct" {
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell),
                let productVC = segue.destination as? ProductsViewController else {
                    return
            }
            productVC.product = products?[indexPath.row]
        }
    }
}

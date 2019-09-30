//
//  ItemListViewController.swift
//  TodoTDD
//
//  Created by QDSG on 2019/8/1.
//  Copyright © 2019 unitTao. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dataProvider: ItemListDataProvider!

}

extension ItemListViewController {
    private func setupUI() {
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
    }
}

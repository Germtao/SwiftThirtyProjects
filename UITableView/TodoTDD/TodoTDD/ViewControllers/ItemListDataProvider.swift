//
//  ItemListDataProvider.swift
//  TodoTDD
//
//  Created by QDSG on 2019/8/1.
//  Copyright © 2019 unitTao. All rights reserved.
//

import UIKit

enum Section: Int {
    case todo
    case done
}

class ItemListDataProvider: NSObject {
    var 
}

extension ItemListDataProvider: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
}

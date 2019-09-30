//
//  Constants.swift
//  TodoTDD
//
//  Created by QDSG on 2019/8/1.
//  Copyright © 2019 unitTao. All rights reserved.
//

import Foundation

struct Constants {
    static let mainBundleIdentifier = "Main"
    static let itemListVcIdentifier = "ItemListViewController"
    static let detailVcIdentifier = "DetailViewController"
    static let inputVcIdentifier = "InputViewController"
    
    static let itemCellIdentifier = "ItemCell"
    
    static let username = "Crystal"
    static let password = "1234"
}

extension Notification {
    static let itemSelectedNotification = Notification.Name("ItemSelectedNotification")
}

//
//  TodoItem.swift
//  Todo
//
//  Created by TAO on 2017/12/5.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

import UIKit

class TodoItem: NSObject {
    
    var id: String
    var image: String
    var title: String
    var date: Date
    
    init(id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }

}

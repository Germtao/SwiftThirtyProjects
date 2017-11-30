//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by TAO on 2017/11/30.
//  Copyright © 2017年 SwaggyT. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    
    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
}

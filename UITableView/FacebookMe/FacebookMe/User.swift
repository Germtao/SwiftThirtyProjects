//
//  User.swift
//  FacebookMe
//
//  Created by QDSG on 2019/7/30.
//  Copyright © 2019 unitTao. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "bayMax", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}

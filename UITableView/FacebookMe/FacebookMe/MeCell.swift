//
//  MeCell.swift
//  FacebookMe
//
//  Created by QDSG on 2019/7/30.
//  Copyright © 2019 unitTao. All rights reserved.
//

import UIKit

class MeCell: UITableViewCell {
    
    static let reuseIdentifier = "MeCellID"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Specs.color.white
        textLabel?.textColor = Specs.color.black
        textLabel?.font = Specs.font.large
        detailTextLabel?.textColor = Specs.color.lightGray
        detailTextLabel?.font = Specs.font.small
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

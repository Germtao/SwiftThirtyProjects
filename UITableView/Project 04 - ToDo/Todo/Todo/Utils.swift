//
//  Utils.swift
//  Todo
//
//  Created by TAO on 2017/12/5.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

import Foundation

func dateFromString(_ dateStr: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: dateStr)
}

func stringFromDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}



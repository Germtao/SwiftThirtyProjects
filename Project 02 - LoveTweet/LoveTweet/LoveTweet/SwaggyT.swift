//
//  SwaggyT.swift
//  LoveTweet
//
//  Created by TAO on 2017/11/30.
//  Copyright © 2017年 SwaggyT. All rights reserved.
//

import Foundation

struct SwaggyT {
    
    var gender: Gender
    var name: String
    var age: Int
    var work: String
    var salary: String
    var isStraight: Bool
    
    var interestedGender: String {
        switch gender {
        case .Female:
            return isStraight ? "Men" : "Women"
        case .Male:
            return isStraight ? "Women" : "Men"
        }
    }
    
    var info: String {
        return "Hi, I am \(name). As a \(age)-year-old \(work) earning \(salary)/year, I am interested in \(interestedGender). Feel free to contact me!"
    }
}

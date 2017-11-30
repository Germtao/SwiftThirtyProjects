//
//  Helper.swift
//  LoveTweet
//
//  Created by TAO on 2017/11/30.
//  Copyright © 2017年 SwaggyT. All rights reserved.
//

import UIKit
import Social

enum Gender: Int {
    case Male = 0
    case Female
}

extension Selector {
    static let endEnditing = #selector(UIView.endEditing(_:))
}

extension UIViewController {
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

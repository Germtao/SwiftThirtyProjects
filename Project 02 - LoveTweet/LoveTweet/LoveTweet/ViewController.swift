//
//  ViewController.swift
//  LoveTweet
//
//  Created by TAO on 2017/11/30.
//  Copyright © 2017年 SwaggyT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tweet: SwaggyT?

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    @IBOutlet weak var workTextField: UITextField!
    
    @IBOutlet weak var salarySlider: UISlider!
    
    @IBOutlet weak var straightSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayPicker.minimumDate = Date()
        
        // 收回键盘
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector.endEnditing))
        
        nameTextField.delegate = self
        workTextField.delegate = self
    }
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        
        salaryLabel.text = "$\((Int)(sender.value))k"
    }
    
    @IBAction func tweetItButtonDidTap(_ sender: UIButton) {
        
        /// 闭包 - 内嵌函数
        /// 获取 name, work, salary
        func getLabelsInfo() -> (name: String?, work: String?, salary: String?) {
            guard let name = nameTextField.text,
                let work = workTextField.text,
                let salary = salaryLabel.text else { return (nil, nil, nil) }
            
            if name.isEmpty || work.isEmpty || salary.isEmpty {
                return (nil, nil, nil)
            }
            
            return (name, work, salary)
        }
        
        /// 获取 age
        func getAge() -> Int? {
            let ageComponents = Calendar.current.dateComponents([.year], from: birthdayPicker.date, to: Date())
            return ageComponents.year
        }
        
        let labelsInfo = getLabelsInfo()
        
        if let name = labelsInfo.name,
            let work = labelsInfo.work,
            let salary = labelsInfo.salary,
            let age = getAge() {
            
            tweet = SwaggyT(gender: Gender(rawValue: genderSegment.selectedSegmentIndex)!,
                            name: name,
                            age: age,
                            work: work,
                            salary: salary,
                            isStraight: straightSwitch.isOn)
        } else {
            tweet = nil
        }
        
        switch tweet {
        case .some(let tweet):
            showAlert(title: "Love Tweet",
                      message: tweet.info,
                      buttonTitle: "OK")
        default:
            showAlert(title: "Info miss or invalid",
                      message: "Please fill out correct personal info",
                      buttonTitle: "OK")
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension UIViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


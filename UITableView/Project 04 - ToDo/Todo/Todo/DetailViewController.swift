//
//  DetailViewController.swift
//  Todo
//
//  Created by TAO on 2017/12/5.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var travelBtn: UIButton!
    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var childBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoDatepicker: UIDatePicker!
    
    var todoItem: TodoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    @IBAction func childBtnDidTap(_ sender: UIButton) {
        resetButton()
        childBtn.isSelected = true
    }
    
    @IBAction func phoneBtnDidTap(_ sender: UIButton) {
        resetButton()
        phoneBtn.isSelected = true
    }
    
    @IBAction func travelBtnDidTap(_ sender: UIButton) {
        resetButton()
        travelBtn.isSelected = true
    }
    
    @IBAction func shoppingCardBtnDidTap(_ sender: UIButton) {
        resetButton()
        shopBtn.isSelected = true
    }
    
    @IBAction func tapDone(_ sender: UIButton) {
        
        setSelectedImage()
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Private Funcs
extension DetailViewController {
    
    private func resetButton() {
        childBtn.isSelected  = false
        phoneBtn.isSelected  = false
        shopBtn.isSelected   = false
        travelBtn.isSelected = false
    }
    
    private func setSelectedImage() {
        
        var image = ""
        if childBtn.isSelected {
            image = "child-selected"
        }
        else if phoneBtn.isSelected {
            image = "phone-selected"
        }
        else if shopBtn.isSelected {
            image = "shopping-cart-selected"
        }
        else if travelBtn.isSelected {
            image = "travel-selected"
        }
        
        if let todoItem = todoItem {
            todoItem.image = image
            todoItem.title = todoTextField.text!
            todoItem.date = todoDatepicker.date
        } else {
            let uuid = UUID().uuidString
            todoItem = TodoItem(id: uuid, image: image, title: todoTextField.text!, date: todoDatepicker.date)
            todoArray.append(todoItem!)
        }
    }
    
}

// MARK: - 数据处理
extension DetailViewController {
    
    private func initData() {
        
        if let todoItem = todoItem {
            
            title = "编辑日程"
            
            if todoItem.image == "child-selected" {
                childBtn.isSelected = true
            } else if todoItem.image == "phone-selected" {
                phoneBtn.isSelected = true
            } else if todoItem.image == "shopping-cart-selected" {
                shopBtn.isSelected = true
            } else if todoItem.image == "travel-selected" {
                travelBtn.isSelected = true
            }
            
            todoTextField.text = todoItem.title
            todoDatepicker.setDate(todoItem.date, animated: false)
            
        } else {
            title = "新建日程"
            childBtn.isSelected = true
        }
        
    }
}

//
//  ViewController.swift
//  Todo
//
//  Created by TAO on 2017/12/5.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

import UIKit

var todoArray: [TodoItem] = []

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        
        navigationItem.leftBarButtonItem = editButtonItem
        todoTableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        todoTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editTodo" {
            let vc = segue.destination as! DetailViewController
            let indexPath = todoTableView.indexPathForSelectedRow
            
            if let indexPath = indexPath {
                vc.todoItem = todoArray[indexPath.row]
            }
        }
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if todoArray.count != 0 {
            return todoArray.count
        } else {
            
            let messageLabel = UILabel()
            
            setupMessageLabel(messageLabel,
                              frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height),
                              text: "没有可用数据",
                              textColor: UIColor.darkGray,
                              numberOfLines: 0,
                              textAlignment: .center,
                              font: UIFont(name: "Palatino-Italic", size: 20)!)
            
            todoTableView.backgroundView = messageLabel
            todoTableView.separatorStyle = .none
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        setupCellWithTodoItem(cell, todoItem: todoArray[indexPath.row])
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    /// editing mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        todoTableView.setEditing(editing, animated: true)
    }
    
    /// delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoArray.remove(at: indexPath.row)
            todoTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todoItem = todoArray.remove(at: sourceIndexPath.row)
        todoArray.insert(todoItem, at: destinationIndexPath.row)
    }
}

// MARK: - Private Funcs
extension ViewController {
    
    private func initData() {
        
        todoArray = [TodoItem(id: "1", image: "child-selected", title: "Go to Disney", date: dateFromString("2017-06-01")!),
                 TodoItem(id: "2", image: "shopping-cart-selected", title: "Cicso Shopping", date: dateFromString("2017-09-01")!),
                 TodoItem(id: "3", image: "phone-selected", title: "Phone to Jobs", date: dateFromString("2017-10-01")!),
                 TodoItem(id: "4", image: "travel-selected", title: "Plan to Europe", date: dateFromString("2017-12-05")!)]
    }
    
}

// MARK: - Helper Funcs
extension ViewController {
    
    private func setupMessageLabel(_ label: UILabel, frame: CGRect, text: String, textColor: UIColor, numberOfLines: Int, textAlignment: NSTextAlignment, font: UIFont) {
        label.frame = frame
        label.text = text
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        label.font = font
        label.sizeToFit()
    }
    
    private func setupCellWithTodoItem(_ cell: UITableViewCell, todoItem: TodoItem) {
        let imageView = cell.viewWithTag(11) as! UIImageView
        let titleLabel = cell.viewWithTag(12) as! UILabel
        let dateLabel = cell.viewWithTag(13) as! UILabel
        
        imageView.image = UIImage(named: todoItem.image)
        titleLabel.text = todoItem.title
        dateLabel.text = stringFromDate(todoItem.date)
    }
    
}


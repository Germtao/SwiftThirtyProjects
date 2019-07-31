//
//  MeViewController.swift
//  FacebookMe
//
//  Created by QDSG on 2019/7/30.
//  Copyright © 2019 unitTao. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController {
    
    typealias RowModel = [String: String]
    
    private var user: User {
        return User(name: "BayMax", education: "CMU")
    }
    
    private var dataSource: [[String: Any]] {
        return TableKeys.populate(with: user)
    }
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(MeCell.self, forCellReuseIdentifier: MeCell.reuseIdentifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension MeViewController {
    private func setupUI() {
        title = "Facebook"
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|",
                                                           options: .directionLeadingToTrailing,
                                                           metrics: nil,
                                                           views: ["tableView": tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|",
                                                           options: .directionLeadingToTrailing,
                                                           metrics: nil,
                                                           views: ["tableView": tableView]))
    }
}

extension MeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(in: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelForRow = rowModel(at: indexPath)
        var cell = UITableViewCell()
        
        guard let title = modelForRow[TableKeys.title] else { return cell }
        
        if title == user.name {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: MeCell.reuseIdentifier, for: indexPath)
        }
        
        cell.textLabel?.text = title
        
        if let imageName = modelForRow[TableKeys.imageName] {
            cell.imageView?.image = UIImage(named: imageName)
        } else {
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        
        if title == user.name {
            cell.detailTextLabel?.text = modelForRow[TableKeys.subTitle]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeader(in: section)
    }
}

extension MeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.title] else { return 0.0 }
        
        if title == user.name {
            return 64.0
        } else {
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.title] else { return }
        
        if title == TableKeys.seeMore ||
            title == TableKeys.addFavorites {
            cell.textLabel?.textColor = Specs.color.tint
            cell.accessoryType = .none
        } else if title == TableKeys.logout {
            cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            cell.textLabel?.textColor = Specs.color.red
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .disclosureIndicator
        }
    }
}

// MARK: - Helper Functions
extension MeViewController {
    private func rows(in section: Int) -> [Any] {
        return dataSource[section][TableKeys.rows] as! [Any]
    }
    
    private func rowModel(at indexPath: IndexPath) -> RowModel {
        return rows(in: indexPath.section)[indexPath.row] as! RowModel
    }
    
    private func titleForHeader(in section: Int) -> String? {
        return dataSource[section][TableKeys.section] as? String
    }
}

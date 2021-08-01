//
//  View.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import Foundation
import UIKit
// MARK: - View

// ViewController
// Protocol
// ref to presenter

// MARK: - Protocol
protocol AnyView {
    var presenter: AnyPresenter? { get set}
    
    func update(with users: Users)
    func update(with error: String)
}
// MARK: - View
class UserViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    var users: Users = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.isHidden = self.users.isEmpty
                self.label.isHidden = !self.users.isEmpty
                self.tableView.reloadData()
            }
        }
    }
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Ooops no data :3"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        label.center = view.center
       
    }
    
    private func setup() {
        view.addSubview(tableView)
        view.addSubview(label)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func update(with users: Users) {
        self.users = users
    }
    
    func update(with error: String) {
        self.users = []
        
    }
    
    
}

// MARK: - TableView
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
}

//
//  ViewController.swift
//  ToDO
//
//  Created by Mac on 08/02/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    var tableView = UITableView()
    var textField = UITextField()
    var button = UIButton()
    var headerView = UIView()
    var toDoList: Results<ToDoItem> {
        get {
            return realm.objects(ToDoItem.self)
        }
    }
    
    let realm = try! Realm()
    let date = Date()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        dateFormatter.dateFormat = "dd/MM/YY, HH:mm"
        
        setupTableView()
        setupButton()
    }

    override func  viewWillAppear(_ animated: Bool) {
        self.title = "ToDo"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    func setupTableView() {
        self.view.addSubview(self.tableView)
        self.view.addSubview(button)
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            self.tableView.bottomAnchor.constraint(equalTo: self.button.topAnchor)
        ])
    }
    
    func setupButton() {
        self.button.setTitle("New Task", for: .normal)
        self.button.tintColor = .white
        self.button.backgroundColor = UIColor.gray
        self.button.addTarget(self, action: #selector(newClicked), for: .touchUpInside)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func newClicked() {
        
        let alertController = UIAlertController(
            title: "New ToDo",
            message: "What do you plan to do?",
            preferredStyle: .alert
        )
        alertController.addTextField {
            $0.placeholder = "Enter text"
            $0.addTarget(self, action: #selector(self.textFieldTextDidChange(_:)), for: .editingChanged)
        }
        
        let message = (alertController.textFields?.first)! as UITextField
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) -> Void in }
        alertController.addAction(actionCancel)
        
        let actionAdd = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) -> Void in
        
            let toDoItem = ToDoItem()
            toDoItem.detail = message.text!
            toDoItem.status = "remaining"
            toDoItem.currentDate = self.dateFormatter.string(from: self.date)
            
            try! self.realm.write({
                self.realm.add(toDoItem)
                self.tableView.insertRows(at: [IndexPath.init(row: self.toDoList.count-1, section: 0)], with: .automatic)
            })
        }
        actionAdd.isEnabled = false
        alertController.addAction(actionAdd)
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldTextDidChange(_ textField: UITextField) {
        if let alert = presentedViewController as? UIAlertController,
            let action = alert.actions.last,
            let text = textField.text {
            action.isEnabled = text.characters.count > 0
        }
    }
}

extension ViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        let item = toDoList[indexPath.row]
        cell.accessoryType = .none
        
        cell.configCell(title: item.detail, details: item.status, created: item.currentDate )
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath
        ) {
        if (editingStyle == .delete){
            let item = toDoList[indexPath.row]
            try! self.realm.write({
                self.realm.delete(item)
            })
            
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoList[indexPath.row]
        try! self.realm.write({
            if (item.status == "remaining") {
                item.status = "done"
            }else{
                item.status = "remaining"
            }
        })
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

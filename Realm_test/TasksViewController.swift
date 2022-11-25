//
//  TasksViewController.swift
//  Realm_test
//
//  Created by Maxim Mitin on 25.11.22.
//

import UIKit
import RealmSwift

class TasksViewController: UITableViewController {
    
    private var taskList: Results<TaskList>!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskList = StorageManager.shared.realm.objects(TaskList.self)
        //createTestData()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return taskList.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let taskLst = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = taskLst.name
        content.secondaryText = "\(taskLst.tasks.count)"
        cell.contentConfiguration = content

        return cell
    }
    
    
    
    private func createTestData() {
        let shoppingList = TaskList()
        shoppingList.name = "Shoping List"
        
        let albumsList = TaskList()
        albumsList.name = "Music to buy"
        
        let bread = Task()
        bread.name = "Bread"
        bread.note = "White or Gray 500g"
        let tea = Task(value: ["Black","200g",Date(),false])
        let chocolate = Task(value: ["80% dark chocolate","100g", Date(), true])
        
        let cof = Task(value: ["Cradle of Filth - Thorngraphy","",Date(),true])
        let met = Task(value: ["Metallica - Load","",Date(),false])
        let myhem = Task(value: ["Mayhem - Puritania","",Date(),false])
        
        shoppingList.tasks.insert(contentsOf: [tea,bread,chocolate], at: 0)
        albumsList.tasks.insert(contentsOf: [cof,met,myhem], at: 0)
        DispatchQueue.main.async {
            StorageManager.shared.save(taskList: [shoppingList, albumsList])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let taskList = taskList[indexPath.row]
        
        guard let tasksVC = segue.destination as? TaskTableViewController else {return}
        tasksVC.taskList = taskList
    }

}


//
//  TaskTableViewController.swift
//  Realm_test
//
//  Created by Maxim Mitin on 26.11.22.
//

import UIKit
import RealmSwift

class TaskTableViewController: UITableViewController {
    
    var taskList: TaskList!
    private var currentTasks: Results<Task>!
    private var completedTasks: Results<Task>!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = taskList.name
        
        currentTasks = taskList.tasks.filter("isCompleted = false")
        completedTasks = taskList.tasks.filter("isCompleted = true")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? currentTasks.count : completedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "CURRENT TASKS" : "COMPLETED TASKS"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = indexPath.section == 0
        ? currentTasks[indexPath.row]
        : completedTasks[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = task.name
        content.secondaryText = task.note
        cell.contentConfiguration = content

        return cell
    }
    

}

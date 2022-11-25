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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    

}

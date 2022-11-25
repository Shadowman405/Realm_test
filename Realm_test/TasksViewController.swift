//
//  TasksViewController.swift
//  Realm_test
//
//  Created by Maxim Mitin on 25.11.22.
//

import UIKit

class TasksViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTestData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

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

}


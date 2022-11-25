//
//  StorageManager.swift
//  Realm_test
//
//  Created by Maxim Mitin on 26.11.22.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    func save(taskList: [TaskList]) {
        try! realm.write {
            realm.add(taskList)
        }
    }
}

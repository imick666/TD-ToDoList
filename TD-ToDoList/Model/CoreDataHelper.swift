//
//  CoreDataHelper.swift
//  TD-ToDoList
//
//  Created by mickael ruzel on 10/10/2020.
//

import Foundation
import CoreData

final class CoreDataHelper {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = AppDelegate().persistentContainer.viewContext) {
        self.context = context
    }
    
    // MARK: - CRUD
    
    // Create
    func createTask(title: String) {
        let newTask = Task(context: context)
        newTask.title = title
        newTask.isDone = false
        
        saveContext()
    }
    
    // Read
    func loadTask() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            let tasks = try context.fetch(request)
            return tasks
        } catch {
            return [Task]()
        }
    }
    
    // Update
    func saveContext() {
        do {
            try context.save()
        } catch {
            return
        }
    }
    
    // Delete
    func deleteTask(_ task: Task) {
        context.delete(task)
        saveContext()
    }
    
}

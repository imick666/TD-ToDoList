//
//  TD_ToDoListTests.swift
//  TD-ToDoListTests
//
//  Created by mickael ruzel on 10/10/2020.
//

import XCTest
@testable import TD_ToDoList

class TD_ToDoListTests: XCTestCase {

    var coreDataHelper: CoreDataHelper?
    
    override func setUp() {
        super.setUp()
        coreDataHelper = CoreDataHelper(context: MokeCoreData.createContext())
    }
    
    override func tearDown() {
        super.tearDown()
        coreDataHelper = nil
    }
    
    // MARK: - CRUD Test
    
    // Create
    func testCreateTask() {
        coreDataHelper?.createTask(title: "buy iphone 12")
        
        let tasks = coreDataHelper?.loadTask()
        XCTAssertEqual(tasks?.count, 1)
        XCTAssertEqual(tasks?[0].title, "buy iphone 12")
    }
    
    // Read
    func testReadTasks() {
        coreDataHelper?.createTask(title: "this is a test")
        
        let tasks = coreDataHelper?.loadTask()
        XCTAssertEqual(tasks?.count, 1)
    }
    
    // Update
    func testUpdateTask() {
        coreDataHelper?.createTask(title: "buy iphone 12")
        
        var tasks = coreDataHelper?.loadTask()
        XCTAssertEqual(tasks?[0].isDone, false)
        
        tasks?[0].isDone = true
        coreDataHelper?.saveContext()
        
        tasks = coreDataHelper?.loadTask()
        XCTAssertEqual(tasks?[0].isDone, true)
    }
    
    // Delete
    func testDeleteTask() {
        coreDataHelper?.createTask(title: "it will be delete")
        
        var tasks = coreDataHelper?.loadTask()
        XCTAssertEqual(tasks?.count, 1)
        
        coreDataHelper?.deleteTask(tasks![0])
        tasks = coreDataHelper?.loadTask()
        XCTAssertEqual(tasks?.count, 0)
    }

}

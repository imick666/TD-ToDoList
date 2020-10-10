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
    
    

}

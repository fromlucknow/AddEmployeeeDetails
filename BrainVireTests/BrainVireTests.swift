//
//  BrainVireTests.swift
//  BrainVireTests
//
//  Created by Saifur Rahman on 19/12/20.
//

import XCTest
import CoreData
@testable import BrainVire

class BrainVireTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_check_if_data_issavinginCoredata() throws{ 
       
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "EmployeeDetails")
        
        //3
        do {
         let people = try managedContext.fetch(fetchRequest)
            for data in people {
                print("name is", data.value(forKey: "name") as! String)
            }
            XCTAssertNotNil(people,)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
      }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

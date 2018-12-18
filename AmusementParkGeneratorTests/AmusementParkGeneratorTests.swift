//
//  AmusementParkGeneratorTests.swift
//  AmusementParkGeneratorTests
//
//  Created by Marcel Busschers on 2018/12/18.
//  Copyright © 2018 Marcel Busschers. All rights reserved.
//

import XCTest
@testable import AmusementParkGenerator_Part1

class AmusementParkGeneratorTests: XCTestCase {
    
    func testClassicGuestInstance() {
        // test for GUEST Instance
        let classicGuest = GuestPass(forType: .ClassicGuest, firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: nil)
        
        let guestPass = GeneratePass(with: classicGuest)
        
        let hasAccess = SwipeRideAccess(for: guestPass)
        
        // Testing to see if guest HAS access
        XCTAssertTrue(hasAccess)
    }
    
    func testVipGuestInstance() {
        // MARK: Run test for VIP Instance
        let vipGuest = GuestPass(forType: .VipGuest, firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: nil)
        
        let guestPass = GeneratePass(with: vipGuest)
        
        let hasAccessToFoodDiscount = SwipeDiscountAccess(for: guestPass, testing: .Food)
        
        // Testing to see if guest has food discount
        XCTAssertTrue(hasAccessToFoodDiscount)
    }
    
    func testChildGuestInstance() {
        // test for CHILD Instance
        let childGuest = GuestPass(forType: .ChildGuest, firstName: "Charlie", lastName: "Rose", streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: DateOfBirth("09/09/1999"))
        
        let guestPass = GeneratePass(with: childGuest)
        
        // Testing if pass wasn't generated: Birthday makes entrant older than 5.
        XCTAssertNil(guestPass.entrant)
    }
    
    func testFoodServiceEmployeeInstance() {
        // test for FOOD EMPLOYEE Instance
        let foodServiceEmployee = EmployeePass(forType: .FoodServicesEmployee, firstName: nil, lastName: "Jackson", streetAddress: "Clorsors Avenue", city: "Wild West", state: "Puerto Rico", zipCode: "12021D", dateOfBirth: nil)
        
        let employeePass = GeneratePass(with: foodServiceEmployee)
    
        // Testing if pass wasn't generated: Pass would contain a nil entrant within
        XCTAssertNil(employeePass.entrant)
    }
    
    func testRideServiceEmployeeInstance() {
        // test for RIDE EMPLOYEE Instance
        let rideServiceEmployee = EmployeePass(forType: .RideSerivesEmployee, firstName: "Jeremy", lastName: "Clarkson", streetAddress: "Westville Close", city: "Miami", state: "Floria", zipCode: "101111", dateOfBirth: nil)
        
        let employeePass = GeneratePass(with: rideServiceEmployee)
        
        let hasOfficeAccess = SwipeAreaAccess(for: employeePass, testing: .OfficeAreas)
        
        // Testing to check if office access is false
        XCTAssertFalse(hasOfficeAccess)
    }
    
    func testMaintanenceEmployeeInstance() {
        // test for MAINANENCE EMPLOYEE Instance
        let maintanenceEmployee = EmployeePass(forType: .MaintenanceEmployee, firstName: "Kevin", lastName: "Solester", streetAddress: "Sea Point Drive", city: "Cape Town", state: "Western Cape", zipCode: nil, dateOfBirth: nil)
        
        let employeePass = GeneratePass(with: maintanenceEmployee)
        
        // Testing if pass wasn't generated: Pass would contain a nil entrant within
        XCTAssertNil(employeePass.entrant)
    }
    
    func testManagerInstance() {
        // tests for MANAGER Instance
        let manager = ManagerPass(firstName: "Jason", lastName: "Richard", streetAddress: "Klerkvol Weg", city: "Haarlem", state: "Noord-Holland", zipCode: "1882HD", dateOfBirth: nil)
        
        let managerPass = GeneratePass(with: manager)
        
        let hasOfficeAccess = SwipeAreaAccess(for: managerPass, testing: .OfficeAreas)
        
        // testing office access, should assert to true
        XCTAssertTrue(hasOfficeAccess)
    }

}

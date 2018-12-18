//
//  Pass.swift
//  AmusementParkGenerator-Part1
//
//  Created by Marcel Busschers on 2018/12/18.
//  Copyright © 2018 Marcel Busschers. All rights reserved.
//

import Foundation

class Pass {
    let entrant: Entrant?
    init(entrant: Entrant?) {
        self.entrant = entrant
    }
}

func GuestPass(forType type: TypeOfEntrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) -> Pass? {
    switch type {
    case .ClassicGuest:
        let classicGuest = ClassicGuest(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        return Pass(entrant: classicGuest)
    case .VipGuest:
        let vipGuest = VipGuest(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        return Pass(entrant: vipGuest)
    case.ChildGuest:
        let childGuest = ChildGuest(dateOfBirth: dateOfBirth, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if childGuest.isErrorFree() {
            return Pass(entrant: childGuest)
        } else {
            return nil
        }
    default:
        return nil
    }
}

func EmployeePass(forType type: TypeOfEntrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) -> Pass? {
    switch type {
    case .FoodServicesEmployee:
        let foodServiceEmployee = FoodServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        if foodServiceEmployee.isErrorFree() {
            return Pass(entrant: foodServiceEmployee)
        } else {
            return nil
        }
    case .MaintenanceEmployee:
        let maintencanceEmployee = MaintenanceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        if maintencanceEmployee.isErrorFree() {
            return Pass(entrant: maintencanceEmployee)
        } else {
            return nil
        }
    case .RideSerivesEmployee:
        let rideServiceEmployee = RideServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        if rideServiceEmployee.isErrorFree() {
            return Pass(entrant: rideServiceEmployee)
        } else {
            return nil
        }
    default:
        return nil
    }
}

func ManagerPass(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) -> Pass? {
    let manager = Manager(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
    if manager.isErrorFree() {
        return Pass(entrant: manager)
    } else {
        return nil
    }
}

// Pass Generator
func GeneratePass(with pass: Pass?) -> Pass {
    if let unwrappedPass = pass {
        print("Pass Generated")
        return unwrappedPass
    } else {
        print("Pass not generated")
        return Pass(entrant: nil)
    }
}


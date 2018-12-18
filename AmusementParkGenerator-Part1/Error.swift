//
//  Error.swift
//  AmusementParkGenerator-Part1
//
//  Created by Marcel Busschers on 2018/12/17.
//  Copyright © 2018 Marcel Busschers. All rights reserved.
//

import Foundation

enum AmusementParkError: Error {
    case MissingBirthday
    case MissingFullName
    case MissingFullAddress
    case NotAChild
    case IncorrectBirthdayFormat // TODO: BDAY Format
}

extension HourlyEmployee {
    // - Missing full name
    // - Missing full address
    
    //Helper method to throw errors
    func checkErrors(for entrant: Entrant) throws {
        if entrant.firstName == nil || entrant.lastName == nil {
            throw AmusementParkError.MissingFullName
        }
        if entrant.streetAddress == nil || entrant.city == nil || entrant.state == nil || entrant.zipCode == nil {
            throw AmusementParkError.MissingFullAddress
        }
    }
    
    func isErrorFree() -> Bool {
        do {
            try checkErrors(for: self)
        } catch AmusementParkError.MissingFullName {
            print("Missing full name")
            return false
        } catch AmusementParkError.MissingFullAddress {
            print("Missing full address, please enter all details within address")
            return false
        } catch let error {
            print("\(error)")
            return false
        }
        return true
    }
}

extension ChildGuest {
    // - Missing Birthday
    // - Not a child
    
    // Helper method to throw errors
    func checkErrors(for entrant: ChildGuest) throws {
        guard let dateOfBirth = entrant.dateOfBirth, let _ = dateOfBirth.date else {
            throw AmusementParkError.MissingBirthday
        }
        if !entrant.isChild() {
            throw AmusementParkError.NotAChild
        }
    }
    
    func isErrorFree() -> Bool {
        do {
            try checkErrors(for: self)
        } catch AmusementParkError.MissingBirthday {
            print("You need to enter a the child's birtday")
            return false
        } catch AmusementParkError.NotAChild {
            print("")
            return false
        } catch let error {
            print("\(error)")
            return false
        }
        return true
    }
}

extension Manager {
    // - Missing full name
    // - Missing full address
    
    //Helper method to throw errors
    func checkErrors(for entrant: Manager) throws {
        if entrant.firstName == nil || entrant.lastName == nil {
            throw AmusementParkError.MissingFullName
        }
        if entrant.streetAddress == nil || entrant.city == nil || entrant.state == nil || entrant.zipCode == nil {
            throw AmusementParkError.MissingFullAddress
        }
    }
    
    func isErrorFree() -> Bool {
        do {
            try checkErrors(for: self)
        } catch AmusementParkError.MissingFullName {
            print("Missing manager's full name")
            return false
        } catch AmusementParkError.MissingFullAddress {
            print("Missing full address, please enter all details within address")
            return false
        } catch let error {
            print("\(error)")
            return false
        }
        return true
    }
}

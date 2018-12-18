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
}

extension HourlyEmployee {
    // MARK: Handle errors in this extension
    // - Missing full name
    // - Missing full address
    
    //Helper method to throw errors
    func checkErrors(for entrant: Entrant) throws {
        if entrant.firstName == "" || entrant.lastName == "" {
            throw AmusementParkError.MissingFullName
        }
        if entrant.streetAddress == "" || entrant.city == "" || entrant.state == "" || entrant.zipCode == "" {
            throw AmusementParkError.MissingFullAddress
        }
    }
    
    func isErrorFree(for entrant: Entrant) -> Bool {
        do {
            try checkErrors(for: entrant)
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
    // MARK: Handle error in this extension
    // - Not a child
}

extension DateOfBirth {
    // MARK: Revert code from Entrants.swift for error handling
    // - Missing Birthday
}

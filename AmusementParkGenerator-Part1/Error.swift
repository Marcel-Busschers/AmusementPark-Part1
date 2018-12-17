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
}

extension ChildGuest {
    // MARK: Handle error in this extension
    // - Not a child
}

extension DateOfBirth {
    // MARK: Revert code from Entrants.swift for error handling
    // - Missing Birthday
}

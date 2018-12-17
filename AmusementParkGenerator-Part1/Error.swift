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

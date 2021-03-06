//
//  Swipe.swift
//  AmusementParkGenerator-Part1
//
//  Created by Marcel Busschers on 2018/12/17.
//  Copyright © 2018 Marcel Busschers. All rights reserved.
//

import Foundation

/// Checks to see if the passed in entrant has access to a specific area type passed in
func SwipeAreaAccess(for pass: Pass, testing typeArea: AreaAccess) -> Bool {
    guard let entrant = pass.entrant else {
        return false
    }
    if entrant.areaAccess.contains(typeArea) {
        checkBirthday(from: pass)
        return true
    }
    return false
}

/// Checks to see if the passed in entrant has access to the rides
func SwipeRideAccess(for pass: Pass) -> Bool {
    guard let entrant = pass.entrant else {
        return false
    }
    if entrant.rideAccess.contains(.AllRides) {
        checkBirthday(from: pass)
        return true
    }
    return false
}

/// Checks to see if the passed in entrant has access to a specific discount type passed in
func SwipeDiscountAccess(for pass: Pass, testing typeDiscount: DiscountAccess) -> Bool {
    //Must first unwrap optional discountArray within the entrant
    guard let entrant = pass.entrant, let discountArray = entrant.discountAccess else {
        return false
    }
    if discountArray.isEmpty {
        return false
    }
    //Compares types
    for discountType in discountArray {
        if discountType.typeOfDiscount == typeDiscount {
            checkBirthday(from: pass)
            return true
        }
    }
    
    return false
}

// Function to check if today is the birthday of the passed in Pass
func checkBirthday(from pass: Pass) {
    if let entrant = pass.entrant, let dateOfBirth = entrant.dateOfBirth, let DOB = dateOfBirth.date {
        let currentDate = Date()
        if currentDate == DOB {
            print("Happy Birthday! Enjoy your day!")
        }
    }
}

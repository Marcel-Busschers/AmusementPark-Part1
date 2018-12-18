//
//  Entrants.swift
//  AmusementParkGenerator-Part1
//
//  Created by Marcel Busschers on 2018/12/17.
//  Copyright © 2018 Marcel Busschers. All rights reserved.
//


import Foundation

// MARK: Access Case Enums
enum TypeOfEntrant {
    case ClassicGuest
    case VipGuest
    case ChildGuest
    case FoodServicesEmployee
    case RideSerivesEmployee
    case MaintenanceEmployee
    case Manager
}

enum AreaAccess: String {
    case AmusementAreas = "Amusement Areas"
    case KitchenAreas = "Kitchen Areas"
    case RideControlAreas = "Ride Control Areas"
    case MaintenanceAreas = "Maintenance Areas"
    case OfficeAreas = "Office Areas"
}

enum RideAccess: String {
    case AllRides = "Access all rides"
    case SkipAllLines = "Skip all ride lines"
}

enum DiscountAccess: String {
    case Food = "% discount on food"
    case Merchandise = "% discount on merchandise"
}

// MARK: Structs for Discount type and DateOfBirth

struct Discount {
    let typeOfDiscount: DiscountAccess
    let percentage: Int
}

struct DateOfBirth {
    let date: Date?
    
    /// Creates a date that takes in Int Values
    init(day: Int?, month: Int?, year: Int?) {
        var dateComponent = DateComponents()
        
        dateComponent.year = year
        dateComponent.month = month
        dateComponent.day = day
        
        self.date = Calendar.current.date(from: dateComponent)
    }
    
    /// Creates a date in format of a string MM/DD/YYYY
    init(_ stringDate: String) {
        let splitStringDate = stringDate.split(separator: "/")
        
        let month = Int(splitStringDate[0])
        let day = Int(splitStringDate[1])
        let year = Int(splitStringDate[2])
        
        self.init(day: day, month: month, year: year)
    }
}

// MARK: Entrant Classes
/// Super Class entrant
class Entrant: HasAccess {
    var typeOfEntrant: TypeOfEntrant?
    
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var dateOfBirth: DateOfBirth?
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [Discount]? = nil
    
    // Init for all Access types
    init(typeOfEntrant: TypeOfEntrant?, areaAccess: [AreaAccess], rideAccess: [RideAccess], discountAccess: [Discount]) {
        self.typeOfEntrant = typeOfEntrant
        
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        self.discountAccess = discountAccess
    }
    
    // Init for only two Access types
    init(typeOfEntrant: TypeOfEntrant?, areaAccess: [AreaAccess], rideAccess: [RideAccess]) {
        self.typeOfEntrant = typeOfEntrant
        
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
    }
    
    // Init for all values
    init(typeOfEntrant: TypeOfEntrant?, areaAccess: [AreaAccess], rideAccess: [RideAccess], discountAccess: [Discount]?, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        self.typeOfEntrant = typeOfEntrant
        
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        self.discountAccess = discountAccess
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
}

// MARK: Guest Entrants - Sub Classes

class ClassicGuest: Entrant {
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        super.init(typeOfEntrant: .ClassicGuest, areaAccess: [.AmusementAreas], rideAccess: [.AllRides], discountAccess: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
    }
}

class ChildGuest: Entrant, Child {
    
    init(dateOfBirth: DateOfBirth?, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) {
        
        super.init(typeOfEntrant: .ChildGuest, areaAccess: [.AmusementAreas], rideAccess: [.AllRides], discountAccess: nil, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
    }
    
    /// Checks to see if the entrant is indeed a child. Creates a dateComponent, minuses 5 years, and compares it to the Date of Birth of the entrant.
    func isChild() -> Bool {
        var dateComponent = DateComponents()
        dateComponent.year = -5
        
        let pastDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        
        //Unwrapping date to compare
        if let pDate = pastDate, let dateStruct = dateOfBirth, let DOB = dateStruct.date {
            if DOB > pDate {
                return true
            }
        }
        return false
    }
}

class VipGuest: Entrant {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        
        let foodDiscount = Discount(typeOfDiscount: .Food, percentage: 10)
        let merchandiseDiscount = Discount(typeOfDiscount: .Merchandise, percentage: 20)
        
        super.init(typeOfEntrant: .VipGuest, areaAccess: [.AmusementAreas], rideAccess: [.AllRides, .SkipAllLines], discountAccess: [foodDiscount, merchandiseDiscount], firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
    }
}

// MARK: Employee Super class - Subclass of Entrant

class HourlyEmployee: Entrant {
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        
        let foodDiscount = Discount(typeOfDiscount: .Food, percentage: 15)
        let merchandiseDiscount = Discount(typeOfDiscount: .Merchandise, percentage: 25)
        
        super.init(typeOfEntrant: nil, areaAccess: [.AmusementAreas], rideAccess: [.AllRides], discountAccess: [foodDiscount, merchandiseDiscount], firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
    }
}

// MARK: Sub Classes of all Employees

class FoodServiceEmployee: HourlyEmployee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        
        self.typeOfEntrant = .FoodServicesEmployee
        self.areaAccess = [.AmusementAreas, .KitchenAreas]
    }
}

class RideServiceEmployee: HourlyEmployee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        
        self.typeOfEntrant = .RideSerivesEmployee
        self.areaAccess = [.AmusementAreas, .RideControlAreas]
    }
}

class MaintenanceEmployee: HourlyEmployee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
        
        self.typeOfEntrant = .MaintenanceEmployee
        self.areaAccess = [.AmusementAreas, .KitchenAreas, .RideControlAreas, .MaintenanceAreas]
    }
}

// Manager Class, sub class of Entrant

class Manager: Entrant {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, dateOfBirth: DateOfBirth?) {
        
        let foodDiscount = Discount(typeOfDiscount: .Food, percentage: 25)
        let merchandiseDiscount = Discount(typeOfDiscount: .Merchandise, percentage: 25)
        
        super.init(typeOfEntrant: .Manager, areaAccess: [.AmusementAreas, .KitchenAreas, .MaintenanceAreas, .OfficeAreas, .RideControlAreas], rideAccess: [.AllRides], discountAccess: [foodDiscount, merchandiseDiscount], firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth)
    }
}

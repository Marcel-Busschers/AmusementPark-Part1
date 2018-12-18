//
//  Protocols.swift
//  AmusementParkGenerator-Part1
//
//  Created by Marcel Busschers on 2018/12/18.
//  Copyright © 2018 Marcel Busschers. All rights reserved.
//

import Foundation

protocol HasAccess {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [Discount]? { get }
}

protocol Child {
    func isChild() -> Bool
}

//
//  Leg.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Leg: Mappable {
    var distance: String?
    var duration: String?
    var startAddress:   String?
    var endAddress:     String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        distance     <- map["distance.text"]
        duration     <- map["duration.text"]
        startAddress <- map["start_address"]
        endAddress   <- map["end_address"]
    }
}

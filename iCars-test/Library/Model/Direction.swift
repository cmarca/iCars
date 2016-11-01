//
//  Direction.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Direction: Mappable {
    var routes: [Route]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        routes <- map["routes"]
    }
}

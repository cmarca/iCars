//
//  Route.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Route: Mappable {

    var summary: String?
    var overviewPolyline: OverviewPolyline?
    var legs: [Leg]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        summary             <- map["summary"]
        overviewPolyline    <- map["overview_polyline"]
        legs                <- map["legs"]
    }
}

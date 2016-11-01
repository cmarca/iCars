//
//  OverviewPolyline.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class OverviewPolyline: Mappable {
    var points: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        points     <- map["points"]
    }
}

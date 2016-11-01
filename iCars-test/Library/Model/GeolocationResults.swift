//
//  GeolocationResults.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class GeolocationResults: Mappable {
    var geolocations: [Geolocation]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        geolocations    <- map["results"]
    }
}

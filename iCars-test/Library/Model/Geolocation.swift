//
//  Geolocation.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class Geolocation: Mappable {
    var address: String?
    var latitude: Double?
    var longitude:   Double?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        address     <- map["formatted_address"]
        latitude    <- map["geometry.location.lat"]
        longitude   <- map["geometry.location.lng"]
    }
}

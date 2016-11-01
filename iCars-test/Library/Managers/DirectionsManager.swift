//
//  DirectionsManager.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import GoogleMaps

class DirectionsManager: NSObject {

    let googleApi = GoogleAPI()
    
    func getGeolocation(address: String, completion:@escaping (_ result:Geolocation)-> ()){
        googleApi.getGeolocation(address: address){ (result:Geolocation) in
            completion(result)
        }
    }
    
    func getDirections(origin: String, destination: String, completion:@escaping (_ result:Direction)-> ()){
        googleApi.getDirections(origin: origin, destination: destination){ (result:Direction) in
            completion(result)
        }
    }
    
}

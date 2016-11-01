//
//  GoogleAPI.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import AlamofireObjectMapper

class GoogleAPI: NSObject {

    func getDirections(originLocation: CLLocation, destinationLocation: CLLocation, completion:@escaping (_ result:Direction)-> ()){
        let originString        = String(originLocation.coordinate.latitude) + "," + String(originLocation.coordinate.longitude)
        let destinationString   = String(destinationLocation.coordinate.latitude) + "," + String(destinationLocation.coordinate.longitude)
        
        getDirections(origin: originString, destination: destinationString, completion: completion)
    }
    
    func getDirections(origin: String, destination: String, completion:@escaping (_ result:Direction)-> ()){

        let directionsAPI = "https://maps.googleapis.com/maps/api/directions/json?"
        let directionsUrlString = directionsAPI +
            "&origin=" + origin.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! +
            "&destination=" + destination.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! +
            "&mode=driving" 

        let directionsUrl = URL.init(string: directionsUrlString)
        
        Alamofire.request(directionsUrl!).responseObject { (response: DataResponse<Direction>) in
            if let direction = response.result.value {
                completion(direction)
            }
        }
        
    }
    
    func getGeolocation(address: String, completion:@escaping (_ result:Geolocation)-> ()){
        let directionsAPI = "https://maps.googleapis.com/maps/api/geocode/json?"
        let directionsUrlString = directionsAPI +
            "&address=" + address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let directionsUrl = URL.init(string: directionsUrlString)
        
        Alamofire.request(directionsUrl!).responseObject { (response: DataResponse<GeolocationResults>) in
            if let geolocationResults = response.result.value {
                print(geolocationResults.geolocations?.first)
                completion((geolocationResults.geolocations?.first)!)
            }
        }
        
    }
    
}

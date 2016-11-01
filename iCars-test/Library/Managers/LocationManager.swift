//
//  LocationManager.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    var cllocationManager: CLLocationManager
    var successBlock:   ((_ userLocation: CLLocationCoordinate2D) -> ())?
    var failureBlock:    (() -> ())?
    
    override init() {
        cllocationManager = CLLocationManager()
        super.init()
        
        cllocationManager.delegate = self
        cllocationManager.requestWhenInUseAuthorization()
        cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func startUpdatingLocation(aSuccessBlock:   @escaping (_ userLocation: CLLocationCoordinate2D) -> (),
                               aFailureBlock:    @escaping () -> ()){
        successBlock    = aSuccessBlock
        failureBlock    = aFailureBlock
        cllocationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        failureBlock!()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        successBlock!(center)
     
        cllocationManager.stopUpdatingLocation()
    }
    
}

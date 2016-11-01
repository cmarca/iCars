//
//  FlowManager.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/31/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import SideMenu
import CoreLocation

class FlowManager: NSObject {
    
    var homeViewController: HomeViewController
    var sideMenuViewController: SideMenuViewController
    var directionsManager: DirectionsManager
    var locationManager: LocationManager
    
    override init() {
        homeViewController      = HomeViewController()
        sideMenuViewController  = SideMenuViewController()
        directionsManager       = DirectionsManager()
        locationManager         = LocationManager()
        super.init()
        
        homeViewController.flowDelegate     = self
        sideMenuViewController.flowDelegate = self
        configureSideMenu()
    }
    
    func configureSideMenu(){
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: sideMenuViewController)
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        SideMenuManager.menuPresentMode = .viewSlideInOut
        SideMenuManager.menuFadeStatusBar = false
    }
    
    func openMenu() {
        homeViewController.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func closeMenu() {
        homeViewController.dismiss(animated: true, completion: nil)
    }
    
    func toggleMyLocation(){
        locationManager.startUpdatingLocation(aSuccessBlock: { (userLocation: CLLocationCoordinate2D) in
            self.homeViewController.userLocationEnable(userLocation: userLocation)
        }) {
            self.homeViewController.userLocationNotAvailable()
        }
    }
    
    
    func showCity(cityName: String){
        directionsManager.getGeolocation(address: cityName) { (result:Geolocation) in
            self.homeViewController.showPoint(location: result)
        }
    }
    
    func showRoute(from: String, to: String){
        directionsManager.getDirections(origin: from, destination: to) { (result:Direction) in
            self.homeViewController.showRoute(direction: result)
        }
    }
    
}

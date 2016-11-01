//
//  HomeViewController.swift
//  iCars-test
//
//  Created by Carlos Marcano on 10/30/16.
//  Copyright © 2016 Carlos Marcano. All rights reserved.
//

import UIKit
import GoogleMaps
import SideMenu

class HomeViewController: UIViewController {
    var flowDelegate: FlowManager?

    @IBOutlet weak var googleMapsView: GMSMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749295, longitude: -122.4194155, zoom: 6.0)
        googleMapsView.camera = camera
        
        flowDelegate?.toggleMyLocation()
    }
    
    
    @IBAction func menuTapped(_ sender: AnyObject) {
        flowDelegate?.openMenu()
    }
    @IBAction func locationTapped(_ sender: AnyObject) {
        flowDelegate?.toggleMyLocation()
    }
    
    func userLocationEnable(userLocation: CLLocationCoordinate2D){
        googleMapsView.isMyLocationEnabled  = true
        let camera = GMSCameraPosition.camera(withLatitude: userLocation.latitude, longitude: userLocation.longitude, zoom: 12.0)
        let update = GMSCameraUpdate.setCamera(camera)
        googleMapsView.animate(with: update)
        
    }
    
    func userLocationNotAvailable(){
        let alertController = UIAlertController(title: "Location Not Available", message: "We couldn't detect your location.", preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alertController.addAction(OkAction)
        self.present(alertController, animated: true) {
        }
    }
    
    func showPoint(location: Geolocation){
        
        googleMapsView.clear()
        
        updateInfoView(location: location)
        
        let position = CLLocationCoordinate2DMake(location.latitude!, location.longitude!)
        let marker = GMSMarker(position: position)
        marker.title = location.address!
        marker.map = googleMapsView
        
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude!, longitude: location.longitude!, zoom: 10.0)
        let update = GMSCameraUpdate.setCamera(camera)
        googleMapsView.animate(with: update)
    }

    
    func showRoute(direction: Direction){
        googleMapsView.clear()
        
        updateInfoView(direction: direction)
        
        let points      = direction.routes?.first?.overviewPolyline?.points
        
        let path        = GMSPath.init(fromEncodedPath:points!)
        let polyline    = GMSPolyline.init(path: path)
        polyline.map    = googleMapsView
        
        let bounds = GMSCoordinateBounds(path: path!)
        let update = GMSCameraUpdate.fit(bounds, withPadding: 50.0)
        googleMapsView.animate(with: update)
    }
    
    func updateInfoView(direction: Direction){
        let mainLeg = direction.routes?.first?.legs?.first
        mainLabel.text = (mainLeg?.startAddress)! + " to " + (mainLeg?.endAddress)!
        secondaryLabel.text = (mainLeg?.distance)! + " • " + (mainLeg?.duration)!
        infoView.isHidden = false
    }
    
    func updateInfoView(location: Geolocation){
        mainLabel.text = location.address!
        secondaryLabel.text = ""
        infoView.isHidden = false
    }
}

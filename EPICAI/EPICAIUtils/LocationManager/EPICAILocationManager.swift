//
//  LocationManager.swift
//  EPICAI
//
//  Created by Abdul Fattah on 30/12/2021.
//  Copyright © 2017 Abdul Fattah. All rights reserved.
//

import UIKit
import CoreLocation


protocol EPICAILocationManagerDelegate {
    func deviceCurrentLocDetails(errorWhilegettingGeoCode:Bool,location:CLLocation)
}


class EPICAILocationManager: NSObject ,CLLocationManagerDelegate {
    
    var delegate:EPICAILocationManagerDelegate?
    var currentLocation : CLLocation?
    var locationManager:CLLocationManager!
    
    struct `Static` {
        static var instance: EPICAILocationManager?
    }
    
    class var shared: EPICAILocationManager {
        if EPICAILocationManager.Static.instance == nil {
            EPICAILocationManager.Static.instance = EPICAILocationManager()
        }
        return EPICAILocationManager.Static.instance!
    }
    
    class func dispose() {
        EPICAILocationManager.Static.instance = nil
    }
    
    override init(){
        super.init()
        self.locationManager = CLLocationManager()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters
        requestPermission()
    }
    
    func requestPermission() {
        switch self.locationManager.authorizationStatus {
        case .authorizedAlways: self.locationManager.startUpdatingLocation()
        case .authorizedWhenInUse: self.locationManager.startUpdatingLocation()
        case .denied:
            self.locationManager.requestWhenInUseAuthorization()
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
        case .restricted:
            self.locationManager.requestWhenInUseAuthorization()
        default : self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:break
        case .denied:
            self.locationManager.stopUpdatingLocation()
        case .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation() //Will update location immediately
        case .authorizedAlways:
            self.locationManager.startUpdatingLocation() //Will update location immediately
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.locationManager.stopUpdatingLocation()
            delegate?.deviceCurrentLocDetails(errorWhilegettingGeoCode: false, location: location)
            EPICAILocationManager.dispose()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let location:CLLocation = CLLocation()
        delegate?.deviceCurrentLocDetails(errorWhilegettingGeoCode: true, location: location)
        EPICAILocationManager.dispose()
    }
}

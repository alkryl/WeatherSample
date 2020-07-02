//
//  LocationService.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 29/06/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationService {
    
    private let locationManager = CLLocationManager()
        
    //MARK: Initialization
    
    init(delegate: CLLocationManagerDelegate) {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = delegate
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        }
    }
    
    //MARK: Methods
    
    func getCurrentLocation() {
        locationManager.requestLocation()
    }
}

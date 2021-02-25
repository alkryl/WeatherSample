//
//  LocationServiceProvider.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import CoreLocation

protocol LocationServiceProviderProtocol {
    var didUpdateLocation: ((Coordinate?, SampleError?) -> ())? { get set }
    func getCurrentLocation()
}

final class LocationServiceProvider: NSObject, LocationServiceProviderProtocol {
    
    private var locationService: LocationServiceProtocol!
    
    var didUpdateLocation: ((Coordinate?, SampleError?) -> ())?
    
    //MARK: Initialization
    
    override init() {
        super.init()
        locationService = LocationService(delegate: self)
    }
    
    //MARK: Methods
    
    func getCurrentLocation() {
        locationService.getCurrentLocation()
    }
}

//MARK: CLLocationManagerDelegate

extension LocationServiceProvider: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        didUpdateLocation?(manager.location?.coordinate, nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        didUpdateLocation?(nil, .location(reason: error.localizedDescription))
    }
}

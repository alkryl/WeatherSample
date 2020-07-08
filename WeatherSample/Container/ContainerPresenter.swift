//
//  ContainerPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

class ContainerPresenter: ContainerPresenterProtocol {
    
    private var configurator: ConfiguratorProtocol!
    private var service: LocationService!
    unowned var view: ContainerViewProtocol!
    
    private var currentLocation: CLLocationCoordinate2D! {
        didSet {
            getWeather(location: currentLocation)
        }
    }
    
    //MARK: Initialization
    
    required init(view: ContainerViewProtocol, configurator: ConfiguratorProtocol) {
        self.view = view
        self.configurator = configurator
        getCurrentLocation()
    }
    
    //MARK: Location
    
    func didUpdateLocation(_ location: CLLocationCoordinate2D?) {
        guard let location = location else { return }
        currentLocation = location
    }
    
    func didFailToUpdateLocation() {
        getCurrentLocation()
    }
    
    private func getCurrentLocation() {
        if service == nil {
            service = LocationService(delegate: view as! CLLocationManagerDelegate)
        }
        service.getCurrentLocation()
    }
    
    //MARK: Weather
    
    private func getWeather(location: CLLocationCoordinate2D) {
        WeatherService().getWeather(location: location) { (data, error) in
            guard let data = data, error == nil else {
                self.view.showError(message: error == nil ? "Empty JSON was received." : error!.localizedDescription)
                return
            }
            
            let (info, error) = data.deserialize() as (WeatherJSON?, Error?)
                        
            guard let weather = info, error == nil else {
                self.view.showError(message: error == nil ? "JSON parsing failed." : error!.localizedDescription)
                return
            }

            self.configureChildPresenters(with: weather)
        }
    }
    
    //MARK: Children
    
    private func configureChildPresenters(with weather: WeatherJSON) {
        configurator.configureChildPresenters(with: weather) {
            self.view.setChildPresenters()
        }
    }
}

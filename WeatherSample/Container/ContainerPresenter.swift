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
    
    //MARK: Instances

    private let presenterConfigurator = PresenterConfigurator()
    private var service: LocationService!
    unowned var view: ContainerViewProtocol!
    
    //MARK: Initialization
    
    required init(view: ContainerViewProtocol) {
        self.view = view
        getCurrentLocation()
    }
    
    //MARK: Location
    
    func didUpdateLocation(_ location: CLLocationCoordinate2D?) {
        guard let location = location else { return }
        getWeather(location: location)
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
                self.view.showError(message: error == nil ?
                    "Empty JSON was received." : error!.localizedDescription)
                return
            }
            
            let (info, error) = data.deserialize() as (WeatherJSON?, Error?)
                        
            guard let weather = info, error == nil else {
                self.view.showError(message: error == nil ?
                    "JSON parsing failed." : error!.localizedDescription)
                return
            }

            self.configureChildPresenters(with: weather)
        }
    }
}

//MARK: Children

extension ContainerPresenter {
    private func configureChildPresenters(with weather: WeatherJSON) {
        presenterConfigurator.configureChildPresenters(with: weather) {
            self.view.setChildPresenters()
        }
    }
    
    func setChildPresenter(for view: AnyObject) {
        presenterConfigurator.setChildPresenter(for: view)
    }
}

//MARK: Scrolling

extension ContainerPresenter {
    func calculateHeightWithParameters(heightConstant: Double,
                                       contentOffset: Double,
                                       barHeight: Double) {
        let areaHeight = 44.0
        
        let newHeight = heightConstant - contentOffset
        let barHeight = areaHeight + barHeight
        
        let headerMaxHeight = 270.0
        let headerMinHeight = areaHeight + barHeight / 4

        if newHeight > headerMaxHeight {
            view.updateHeader(with: headerMaxHeight, blocked: false)
        } else if newHeight < headerMinHeight {
            view.updateHeader(with: headerMinHeight, blocked: false)
        } else {
            view.updateHeader(with: newHeight, blocked: true)
        }
                                
        presenterConfigurator.topPresenter.updateAlpha((newHeight - 210.0) / 50)
    }
}

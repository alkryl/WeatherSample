//
//  PreloadInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import CoreLocation

final class PreloadInteractor {
    
    weak var presenter: PreloadPresenterProtocol!
    
    //MARK: Services
    
    private var locationServiceProvider: LocationServiceProviderProtocol = LocationServiceProvider()
    private var weatherServiceProvider: WeatherServiceProviderProtocol = WeatherServiceProvider()
    private var cacheServiceProvider: CacheServiceProviderProtocol = CacheServiceProvider()
    
    //MARK: Initialization
    
    required init(presenter: PreloadPresenterProtocol) {
        self.presenter = presenter
        setProviders()
    }
}

//MARK: PreloadInteractorProtocol

extension PreloadInteractor: PreloadInteractorProtocol {
    func getWeather() {
        locationServiceProvider.getCurrentLocation()
    }
}

//MARK: Private

extension PreloadInteractor {
    private func setProviders() {
        locationServiceProvider.didUpdateLocation = { [weak self] (location, error) in
            self?.didUpdateLocation(location, error: error)
        }
                
        weatherServiceProvider.didReceived = { [weak self] json in
            self?.didObtainWeather(json)
        }
        
        weatherServiceProvider.showError = { [weak self] error in
            self?.showError(error)
        }
    }
        
    private func didUpdateLocation(_ location: Coordinate?, error: SampleError?) {
        guard let location = location else {
            showError(error)
            return
        }
        weatherServiceProvider.getWeather(for: location)
    }
    
    private func didObtainWeather(_ json: WeatherJSON) {
        cacheServiceProvider.cache(json)
        presenter.showWeather()
    }
    
    private func showError(_ error: SampleError?) {
        guard let error = error else { return }
        presenter.showError(error.description)
    }
}

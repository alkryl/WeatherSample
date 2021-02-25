//
//  WeatherServiceProvider.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 25.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

protocol WeatherServiceProviderProtocol {
    var showError: ((SampleError?) -> ())? { get set }
    var didReceived: ((WeatherJSON) -> ())? { get set}
    func getWeather(for location: Coordinate)
}

struct WeatherServiceProvider: WeatherServiceProviderProtocol {
    
    private var weatherService: WeatherServiceProtocol = WeatherService()
    
    var showError: ((SampleError?) -> ())?
    var didReceived: ((WeatherJSON) -> ())?
    
    //MARK: Methods
    
    func getWeather(for location: Coordinate) {
        weatherService.getWeather(for: location) { (data, error) in
            guard let data = data, error == nil else {
                showError?(error)
                return
            }
                        
            let result = Mapper().map(data)
                        
            guard let weather = result.mapped, result.error == nil else {
                showError?(error)
                return
            }
            
            didReceived?(weather)
        }
    }
}

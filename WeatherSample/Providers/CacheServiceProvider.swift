//
//  CacheServiceProvider.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 25.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

protocol CacheServiceProviderProtocol {
    func cache(_ json: WeatherJSON)
    func getWeather() -> WeatherJSON?
}

struct CacheServiceProvider: CacheServiceProviderProtocol {
    
    private let cacheService = CacheService<String, WeatherJSON>()
    
    //MARK: Methods
    
    func cache(_ json: WeatherJSON) {
        cacheService[Key.weather] = json
    }
    
    func getWeather() -> WeatherJSON? {
        return cacheService[Key.weather]
    }
}

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

private let cacheService = CacheService<String, WeatherJSON>()

struct CacheServiceProvider: CacheServiceProviderProtocol {    
    
    //MARK: Methods
    
    func cache(_ json: WeatherJSON) {
        cacheService[CacheEnviroment.Key.weather] = json
    }
    
    func getWeather() -> WeatherJSON? {
        return cacheService[CacheEnviroment.Key.weather]
    }
}

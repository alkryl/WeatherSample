//
//  WeatherService.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import CoreLocation

protocol WeatherServiceProtocol {
    func getWeather(for location: Coordinate, completion: @escaping NetworkHandler)
}

struct WeatherService: WeatherServiceProtocol {
        
    //MARK: Methods
    
    func getWeather(for location: Coordinate, completion: @escaping NetworkHandler) {
        guard let url = API.weatherUrl(for: location) else {
            completion(nil, .invalid(reason: Reason.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, .obtaining(reason: error.localizedDescription))
                    return
                }
                completion(data, nil)
            }
        }.resume()
    }
}

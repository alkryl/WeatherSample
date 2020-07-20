//
//  WeatherService.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherService {
    
    private let queue = DispatchQueue.global(qos: .userInteractive)
    
    //MARK: Methods
    
    func getWeather(location: CLLocationCoordinate2D,
                    completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = API.weatherUrl(location: location) else { return }
        
        queue.async(execute: DispatchWorkItem {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            }.resume()
        })
    }
}

//
//  WeatherService.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

private struct API {
    fileprivate static let key = "f05c0e6ed25af2c425ef113e8bb6f705"
    
    fileprivate static func url(location: CLLocationCoordinate2D) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/onecall?" +
                           "lat=\(location.latitude)&lon=\(location.longitude)&" +
                           "units=metric&" +
                           "lang=en&" +
                           "appid=\(self.key)")
    }
}

struct WeatherService {
    
    private let queue = DispatchQueue.global(qos: .userInteractive)
    
    //MARK: Methods
    
    func getWeather(location: CLLocationCoordinate2D, completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = API.url(location: location) else { return }
        
        queue.async(execute: DispatchWorkItem {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            }.resume()
        })
    }
}

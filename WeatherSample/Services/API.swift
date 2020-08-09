//
//  API.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

struct API {
    private static let weatherKey = "f05c0e6ed25af2c425ef113e8bb6f705"
    
    static func weatherUrl(location: CLLocationCoordinate2D) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/onecall?" +
                           "lat=\(location.latitude)&lon=\(location.longitude)&" +
                           "units=metric&" +
                           "lang=en&" +
                           "appid=\(weatherKey)")
    }
    
    static func githubUrl() -> URL? {
        return URL(string: "https://github.com/alkryl")
    }
}

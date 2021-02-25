//
//  Constants.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import CoreLocation

typealias Coordinate = CLLocationCoordinate2D

typealias NetworkHandler = (Data?, SampleError?) -> ()

struct APIEnviroment {
    static let weatherKey = "f05c0e6ed25af2c425ef113e8bb6f705"

    struct Address {
        static let github = "https://github.com/alkryl"
        static let base = "https://api.openweathermap.org/data/2.5/onecall?"
    }
    
    struct Unit {
        static let metric = "metric"
    }
    
    struct Language {
        static let english = "en"
    }
}

struct Segue {
    static let showWeather = "showWeather"
}

struct Text {
    static let close = "Close"
}

struct Key {
    static let weather = "weatherKey"
}

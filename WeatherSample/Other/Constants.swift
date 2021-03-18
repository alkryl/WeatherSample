//
//  Constants.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit
import CoreLocation

typealias Coordinate = CLLocationCoordinate2D
typealias FloatType  = CGFloat
typealias SizeType   = CGSize
typealias PathType   = IndexPath

typealias NetworkHandler = (Data?, SampleError?) -> ()

struct APIEnviroment {
    struct Key {
        static let weather = "f05c0e6ed25af2c425ef113e8bb6f705"
    }

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

struct CacheEnviroment {
    struct Key {
        static let weather = "weatherKey"
    }
}

struct K {
    struct Weather {
        struct ID {
            static let sunrise = 900
            static let sunset  = 901
        }
        
        struct Text {
            static let now = "Now"
            static let sunrise = "Sunrise"
            static let sunset = "Sunset"
        }
    }
    
    struct Cell {
        struct Height {
            static let container: FloatType = 814.0
            static let hour: FloatType = 100.0
            static let day: FloatType = 33.0
            static let info: FloatType = 57.0
        }
        
        struct Width {
            static let hour: FloatType = 60.0
        }
    }
    
    struct Segue {
        static let showWeather = "showWeather"
        static let showGithub = "showGithub"
    }
    
    struct Font {
        struct Size {
            static let hour: FloatType = 15.0
            static let degree: FloatType = 17.0
        }
    }
        
    struct Layout {
        static let minimumLineSpacing: FloatType = 0.0
    }
    
    struct Symbol {
        static let underscore = "_"
        static let slash = "/"
        static let space = " "
        static let dash = "-"
    }
    
    struct Number {
        static let mmHg = 0.750064
        static let metresInKm = 1000
    }
    
    struct Text {
        static let close = "Close"
    }
}

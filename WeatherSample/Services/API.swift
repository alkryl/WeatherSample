//
//  API.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

protocol APIProtocol {
    static func weatherUrl(for location: Coordinate) -> URL?
    static func githubUrl() -> URL?
}

struct API: APIProtocol {
    static func weatherUrl(for location: Coordinate) -> URL? {
        return URL(string: APIHelper().weatherAddress(for: location))
    }
    
    static func githubUrl() -> URL? {
        return URL(string: APIEnviroment.Address.github)
    }
}

//MARK: Helper

private struct APIHelper {
    enum Key {
        case base, latitude, longitude, units, language, appIdentifier
    }
    
    //MARK: Properties
            
    static var parameters: [Key : String] {
        return [.base : APIEnviroment.Address.base,
                .latitude : "lat=",
                .longitude : "&lon=",
                .units : "&units=",
                .language : "&lang=",
                .appIdentifier : "&appid="]
    }
    
    let param: (Key) -> (String) = { key in
        return parameters[key].orEmpty
    }
    
    //MARK: Methods
    
    func weatherAddress(for location: Coordinate) -> String {
        return param(.base) +
               param(.latitude) + "\(location.latitude)" +
               param(.longitude) + "\(location.longitude)" +
               param(.units) + APIEnviroment.Unit.metric +
               param(.language) + APIEnviroment.Language.english +
               param(.appIdentifier) + APIEnviroment.weatherKey
    }
}
